class MembershipsController < ApplicationController

  def create 
    membership = Membership.create(membership_params)
    render json: membership, status: :created
  end


  private

  def membership_params 
    permit.params(:charge, :gym_id, :client_id)
  end

end
