class Api::SessionsController < ApplicationController

  def destroy

    if current_user
      logout
      render json: {}
    else
      render(json: ["Nobody Signed In"], status: 404)
    end
  end

end
