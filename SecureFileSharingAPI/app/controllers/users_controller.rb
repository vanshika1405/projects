
class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create

    def new
      @user = User.new
    end
  
    def create
      user = User.new(user_params)
  
      #respond_to do |format|
        if user.save
          token = JsonWebToken.encode(user_id: user.id)
          
          #format.html { redirect_to root_path, notice: 'User created successfully' } # Redirect for HTML request
            render json: { message: 'User created successfully', token: token }, status: :created  # JSON response for API request
        else
          #format.html { render :new, alert: 'User creation failed' } # Render new view for HTML request
           render json: { error: 'User creation failed', details: user.errors.full_messages }, status: :unprocessable_entity  # JSON response for API request
        end
      #end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  end
  
  
  
  
  
  
  