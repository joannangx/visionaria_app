class TaggedPost < ActiveRecord::Base
    belongs_to :user
    has_many :taggedcomments, :dependent => :destroy
    has_many :likes, :dependent => :destroy
    has_many :helps, :dependent => :destroy
    has_many :inspires, :dependent => :destroy
    has_many :liking_users, :through => :likes, :source => :user
    validates :content, :presence => true, length: { maximum: 280, too_long: "%{count} characters is the maximum allowed" }
    validates :tag, :presence => true
    validates :category, :presence => true
    
    def self.all_categories
        %w(Observation Challenge Innovation)
    end
    
    def classname
        'taggedpost'
    end

    def find_username
        User.find(self.user_id).username
    end 

    def self.all_un_goals
        ['No Poverty', 'Zero Hunger', 'Good Health And Well-being', 'Quality Education', 'Gender Equality', 
        'Clean Water And Sanitation', 'Affordable And Clean Energy', 'Decent Work And Ecnomic Growth', 
        'Industry, Innovation And Infrastructure', 'Reduced Inqualities', 'Sustainale Cities And Communities', 
        'Responsible Consumption And Production', 'Climate Action', 'Life Below Water', 'Life On Land', 
        'Peace, Justice and Strong Institutions', 'Partnerships For The Goals']
    end
end
