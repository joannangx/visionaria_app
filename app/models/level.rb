class Level < ActiveRecord::Base
# Only belongs to user
  belongs_to :user
end
