class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2], 
         :authentication_keys => [:email]
  
  has_many :points, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :tagged_posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :taggedcomments, :dependent => :destroy
  has_many :likes, :source => :posts, :dependent => :destroy
  has_many :helps, :source => :posts, :dependent => :destroy
  has_many :inspires, :source => :posts, :dependent => :destroy
  has_one :profile, :dependent => :destroy

  validates_presence_of :username
  
  has_attached_file :avatar, styles: { :medium => "300x300>", :thumb =>"100x100>" }, :default_url => ":style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  ADMIN_EMAILS = ['admin@example.com', 'rucker95@gmail.com', 'joanna.ng@berkeley.edu', 'paul@visionarianetwork.org', 
                  'genevieve@visionarianetwork.org', 'paola.saldivias@visionarianetwork.org', 'contact@visionarianetwork.org']
  
  def self.admins
    ADMIN_EMAILS
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.admin = true if User.admins.include?(user.email) 
        user.username = auth.info.name
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        if (auth.provider == "facebook")
          processed_uri = process_uri(auth.info.image)
          user.avatar = URI.parse(processed_uri)
        end
    end
  end
  
  def public_posts
    self.posts.where('public = ?', true).order('created_at DESC')
  end  
  
  def public_tagged_posts
    self.tagged_posts.where('public = ?', true).order('created_at DESC')
  end  
  
  def liked?(post)
    if post.classname == 'post'
      !Like.find_by(:post_id => post.id, :user_id => self.id).nil?
    else
      !Like.find_by(:tagged_post_id => post.id, :user_id => self.id).nil?
    end
  end
  
  def helped?(post)
    if post.classname == 'post'
      !Help.find_by(:post_id => post.id, :user_id => self.id).nil?
    else
      !Help.find_by(:tagged_post_id => post.id, :user_id => self.id).nil?
    end
  end
  
  def inspired?(post)
    if post.classname == 'post'
      !Inspire.find_by(:post_id => post.id, :user_id => self.id).nil?
    else
      !Inspire.find_by(:tagged_post_id => post.id, :user_id => self.id).nil?
    end
  end

  private
  def self.process_uri(uri)
    avatar_url = URI.parse(uri)
    avatar_url.scheme = 'https'
    avatar_url.to_s << "?type=large"
  end
end
