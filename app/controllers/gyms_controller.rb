class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_message

    def index 
        render json: Gym.all
    end

    def show 
        gym = Gym.find(params[:id])
        render json: gym       
    end

   def destroy
        gym = Gym.find(params[:id])
        gym.destroy 
        head :no_content
    end

    def update
        gym = Gym.find_by(id: params[:id])
        gym.update(gym_params)
        render json: gym
      end

    private  

    def record_not_found_message
        render json: {error: "Gym not found"}, status: :not_found
       end

       def gym_params
        permit.params(:name, :address)
       end

end
