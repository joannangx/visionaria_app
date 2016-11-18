class Points < ActiveRecord::Base
# Only belongs to user
  belongs_to :user
end
