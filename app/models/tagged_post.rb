class TaggedPost < ActiveRecord::Base
  #has_merit
  
    belongs_to :user
    has_many :taggedcomments
    has_many :points
    has_many :likes
    has_many :helps
    has_many :inspires
    has_many :liking_users, :through => :likes, :source => :user
    validates :content, :presence => true
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
