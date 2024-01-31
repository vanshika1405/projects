class ApplicationController < ActionController::API
    #protect_from_forgery with: :null_session
    before_action :authorize_request

  private

  def authorize_request
    # Add your authorization logic here
    # This method will be called before each action in your controllers
  end
end
