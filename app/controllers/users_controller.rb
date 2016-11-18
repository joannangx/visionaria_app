class UsersController < ApplicationController
    before_filter :authenticate_user!
    
    def points_increment
        self.point = self.point + 1
    end
    
end