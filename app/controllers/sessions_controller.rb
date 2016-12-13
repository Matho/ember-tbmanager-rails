class SessionsController < ApplicationController
  def create

    user = User.find_by_email(params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      if request.format.json?
        data = {
            token: user.authentication_token,
            email: user.email
        }
        render json: data, status: 201 and return
      end
    end
  end
end