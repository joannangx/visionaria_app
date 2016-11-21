class PointsController < ApplicationController
    def point_params
        params.require(:point).permit(:regular, :poverty, :hunger, :health, :education, :gender, :sanitation,
                                        :energy, :economy, :industry, :inequalities, :cities, :consumption, 
                                        :climate, :water, :land, :peace, :partnerships)
    end    
    
    def update
        @points_sys = current_user.point
        @points_sys.update(point_params)
    end
end    