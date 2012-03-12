class ProblemsController < ApplicationController
  respond_to :html
  expose(:phase) { Phase.find(params[:phase_id]) if params[:phase_id].present? }
  expose(:problems) { phase ? phase.problems : Problem.all }
  expose(:problem) 

  def index
    authorize! :read, Problem
  end

  def show
    authorize! :read, problem
    respond_with problem
  end

  def new
    authorize! :new, problem
    respond_with problem
  end

  def edit
    authorize! :edit, problem
    respond_with problem
  end

  def create
    problem.user = current_user
    authorize! :create, problem
    flash[:notice] = 'Pregunta guardada' if problem.save
    respond_with problem
  end

  def update
    authorize! :update, problem
    flash[:notice] = 'Pregunta modificada' if problem.save
    respond_with problem
  end
end
