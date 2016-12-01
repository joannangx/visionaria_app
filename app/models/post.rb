class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments, :dependent => :destroy
    has_many :likes, :dependent => :destroy
    has_many :helps, :dependent => :destroy
    has_many :inspires, :dependent => :destroy
    has_many :liking_users, :through => :likes, :source => :user
    validates :content, :presence => true
    def classname
        'post'
    end
    
    def find_username
        User.find(self.user_id).username
    end    
end
