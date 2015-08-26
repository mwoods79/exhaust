class TodosController < ApplicationController
  def index
    render json: todos
  end

  private

  def todos
    Todo.all
  end
end
