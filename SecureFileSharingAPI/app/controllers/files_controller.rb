class FilesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  before_action :set_file, only: [:show, :destroy]
  before_action :authorize_request, except: [:create, :new]

  def index
    @files = FileResource.all
    render :index
  end

  def show
    render json: @file
  end

  def new
    @file = FileResource.new
  end

  def create
    @file = FileResource.new(file_params)
    @file.file_data.attach(params[:file_data])
  
    if @file.save
      render json: { message: 'File uploaded successfully' }, status: :created
    else
      render json: { error: 'File upload failed', details: @file.errors.full_messages }, status: :unprocessable_entity
    end
  end
  

  def destroy
    @file.destroy
    head :no_content
  end

  private

  def set_file
    @file = FileResource.find(params[:id])
  end

  def file_params
    params.permit(:name, :file_data)
  end

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header

    if token.present?
      decoded = JsonWebToken.decode(token)

      if decoded
        @current_user = User.find(decoded[0]['user_id'])
      else
        render json: { error: 'Invalid token' }, status: :unauthorized
      end
    else
      @current_user = nil
      render json: { error: 'Token missing' }, status: :unauthorized
    end
  end
end



  
  