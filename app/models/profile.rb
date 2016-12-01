class Profile < ActiveRecord::Base
    belongs_to :user

    def check_params(lang)
        if lang == 'esp'
            self.info = "Haga clic en el texto para editar." if self.info.blank?
            self.motivations = "Haga clic en el texto para editar." if self.motivations.blank?
            self.priorities = "Haga clic en el texto para editar." if self.priorities.blank?
        else    
            self.info = "Click on text to edit user info." if self.info.blank?
            self.motivations = "Click on text to edit user motivations." if self.motivations.blank?
            self.priorities = "Click on text to edit user priorities." if self.priorities.blank?
        end
    end
end
