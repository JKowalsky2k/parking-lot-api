class StaticController < ApplicationController
    before_action :require_token, only: [:summary]
    swagger_controller :static, 'Static'

    def index
        @parking_slots = ParkingSlot.all
        @users = User.all
    end
    
    swagger_api :summary do
        summary "Shows a summary for authenticated user"
        param :header, "Authorization", :string, :required, "Authentication token"
      end
    def summary
    end
end
