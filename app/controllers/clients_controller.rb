class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_message

    def index 
        render json: Client.all
    end

    def show 
        client = Client.find(params[:id])
        render json: client       
    end
    
    def update
        client = Client.find_by(id: params[:id])
        client.update(client_params)
        render json: gym
      end

    private  

    def record_not_found_message
        render json: {error: "Client not found"}, status: :not_found
       end

       def client_params
        permit.params(:name, :age)
       end
end
