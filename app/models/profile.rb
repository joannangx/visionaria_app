class Profile < ActiveRecord::Base
    belongs_to :user

    def check_params
        self.info = "Click on text to edit user info." if self.info.blank?
        self.motivations = "Click on text to edit user motivations." if self.motivations.blank?
        self.priorities = "Click on text to edit user priorities." if self.priorities.blank?
    end
end
