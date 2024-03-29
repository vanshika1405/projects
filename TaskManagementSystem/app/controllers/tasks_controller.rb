class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
  
    
    def index
      @tasks = Task.all
  
      respond_to do |format|
        format.html 
        format.json { render json: @tasks } # Render JSON format
      end
    end
  
    
    def show
      respond_to do |format|
        format.html 
        format.json { render json: @task } 
      end
    end
  
    
    def new
      @task = Task.new
    end
  
    
    def create
      @task = Task.new(task_params)
    
      respond_to do |format|
        if @task.save
          format.html { redirect_to @task, notice: 'Task was successfully created.' }
          format.json { render json: @task, status: :created, location: @task }
        else
          format.html { render :new }
          format.json { render json: @task.errors, status: :unprocessable_entity, content_type: 'application/json; charset=utf-8' }
        end
      end
    end
    
    
    
  
    
    def edit
    end
  

    def update
      respond_to do |format|
        if @task.update(task_params)
          format.html { redirect_to @task, notice: 'Task was successfully updated.' }
          format.json { render json: @task, status: :ok, location: @task }
        else
          format.html { render :edit }
          format.json { render json: @task.errors, status: :unprocessable_entity, content_type: 'application/json; charset=utf-8' }
        end
      end
    end
    

  
    
def destroy
  @task.destroy
  respond_to do |format|
    format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
    format.json { head :no_content, content_type: 'application/json; charset=utf-8' }
  end
end


  
    private
  
    
    def set_task
      @task = Task.find(params[:id])
    end
  
    
    def task_params
      params.require(:task).permit(:title, :description, :status)
    end
    
  end
  
  