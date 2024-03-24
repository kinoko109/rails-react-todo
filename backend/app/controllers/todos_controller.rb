class TodosController < ApplicationController
  before_action :find_todo, only: [:show, :update, :destroy]

  def index
    @todos = Todo.all

    render json: @todos
  end

  def show
    render json: @todo
  end

  private
  def find_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :description, :completed)
  end
end
