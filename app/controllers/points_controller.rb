class PointsController < ApplicationController
    def points_params
        params.require(:point).permit(:amount, :level)
    end
    
    def update
        self.update(points_params)
    end
    
end