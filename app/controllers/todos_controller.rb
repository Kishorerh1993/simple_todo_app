class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :mark_complete, :edit, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index
    authorize Todo
    @todos = Todo.where(:user => current_user).reverse
  end

  def completed
    authorize Todo
    @todos= Todo.where(:user => current_user ,:completed =>true).reverse
    render 'index'
  end

  def active
    authorize Todo
    @todos= Todo.where(:user => current_user ,:completed =>false).reverse
    render 'index'
  end

  # GET /todos/new
  def new
    @todo = Todo.new
    authorize @todo
  end

  def mark_complete
    authorize @todo
    @todo.toggle(:completed)
    @todo.save
    redirect_to todos_url
  end

  # POST /todos
  # POST /todos.json
  def create
    authorize Todo
    @todo = Todo.new(todo_params)
    @todo.user = current_user

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_url, notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: todos_url }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    authorize @todo
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:title, :note, :completed, :user_id)
    end
end
