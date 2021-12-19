class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_message

    def show 
        gym = Gym.find(params[:id])
        render json: gym       
    end

   def destroy
        gym = Gym.find(params[:id])
        gym.destroy 
        head :no_content
    end

    private  

    def record_not_found_message
        render json: {error: "Gym not found"}, status: :not_found
       end

end
