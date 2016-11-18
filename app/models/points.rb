class Points < ActiveRecord::Base
  belongs_to :post
  belongs_to :tagged_post
  belongs_to :user
end
