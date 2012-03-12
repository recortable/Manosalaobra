class PhasesController < ApplicationController
  respond_to :html
  expose(:phases) { Phase.all }
  expose(:phase)

  def index
    authorize! :view, Phase 
    respond_with phases
  end

  def show
    authorize! :view, phase
    respond_with phase
  end

  def new
    authorize! :new, phase
    respond_with phase
  end

  def edit
    authorize! :edit, phase
    respond_with phase
  end

  def create
    authorize! :create, phase
    flash[:save] = 'Fase creada' if phase.save
    respond_with phase
  end

  def update
    authorize! :update, phase
    flash[:save] = 'Fase guardada' if phase.update_attributes(params[:phase])
    respond_with phase
  end
end
