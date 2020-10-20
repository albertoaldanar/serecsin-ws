class Api::V1::TasksController < ApplicationController
  def create_task
    task = Task.new(require_params)

    if task.save
      render json: { "task": task, "response": "SUCCESS"}, status: :ok
    else
      render json: { error: task.errors, is_success: false}, status: 422
    end
  end

  def edit_task
    task = Task.find(params[:id])
    task.update!(require_params)

    render json: { "task_updated": task, "response": "SUCCESS" }
  end

  def delete_task
    task = Task.find(params[:id])

    if task.destroy
      render json: { "response": "SUCCESS" }
    else
      render json: { "response": "ERROR" }
    end
  end

  def filtered_tasks
    tasks = Task.where( "day = ?", params[:day] )

    render json: {"tasks": tasks}
  end

  def all_tasks

    tasks = Task.all

    render json: {"tasks": tasks}
  end


  def create_multiple_tasks

    tasks = params[:tasks]

    task_array = []

    tasks.each do |task|
      task_array << {"client": task["client"], "day": task["day"]}
    end

    Task.create(task_array)

    render json: {"tasks": task_array, "response": "SUCCESS"}
  end

  def delete_tasks
    @tasks = Task.destroy_all

    render json: {"tasks": @tasks}
  end

  def delete_multiple_tasks
    tasks = Task.where(day: params[:day])

    if tasks.delete_all
      render json: {"response": "SUCCESS"}
    else
      render json: {"response": "ERROR"}
    end
  end

  private
    def require_params
      params.require(:task).permit!
    end

    def require_multiple_params
      params.require(:task).permit!
    end

end
