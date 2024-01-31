

class UsersController < ApplicationController
 

   def index 
     @user = User.all
     render_json_success(@users)
   end
  def register
    @user = User.new(user_params)

    if @user.save
      render_json_success('User registered successfully')
    else
      render_json_error(@user.errors.full_messages, :unprocessable_entity)
    end
  end

  def login
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      token = TokenService.encode(user_id: @user.id)
      render_json_success({ token: token, email: @user.email })
    else
      render_json_error('Invalid email or password', :unauthorized)
    end
  end

  def logout
    
    render_json_success('User logged out successfully')
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end

  def render_json_success(data, status = :ok)
    render json: { success: true, data: data }, status: status
  end

  def render_json_error(errors, status = :bad_request)
    render json: { success: false, errors: errors }, status: status
  end
end
