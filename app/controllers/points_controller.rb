class PointsController < ApplicationController
    def point_params
        params.require(:point).permit(:regular)
    end    
    
    def update
        @points_sys = current_user.point
        @points_sys.update(point_params)
    end
end    