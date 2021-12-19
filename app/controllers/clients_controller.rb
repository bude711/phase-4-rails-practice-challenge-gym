class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_message
    def show 
        client = Client.find(params[:id])
        render json: client       
    end

    private  

    def record_not_found_message
        render json: {error: "Client not found"}, status: :not_found
       end
end
