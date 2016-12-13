class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.json { render json: @user }
    end
  end

  def create
    @user = User.new(user_params)
    @user.authentication_token = SecureRandom.base58(24)
    @user.password = user_params[:password]
    @user.save

    @user.password = ""

    puts "UsersController#create params: " + @user.to_json

    respond_to do |format|
      format.json { render json: @user }
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_params)
        format.json {  render json: @user}
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    hash = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    hash.slice!(:id, :name, :email, :password, :authentication_token)
    hash
  end

end
