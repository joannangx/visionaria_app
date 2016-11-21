class Points < ActiveRecord::Base
  #has_merit
  belongs_to :post
  belongs_to :tagged_post
  belongs_to :user
end
