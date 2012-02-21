# encoding: utf-8
class ProposedNamesController < ApplicationController
  before_filter :require_user, except: [:index, :create]
  respond_to :html, :json, :xml

  expose(:page) { Page.find 2 }
  expose(:proposed_names) { ProposedName.order('votes_value DESC') }
  expose(:proposed_name)

  def index
    respond_with proposed_names
  end

  def show
    respond_with proposed_name
  end

  def create
    proposed_name.request_ip = request.remote_ip
    flash[:notice] = "Se ha guardado ¡Bien!" if proposed_name.save
    respond_with proposed_name, location: proposed_names_path
  end

  def destroy
    authorize! :delete, ProposedName
    flash[:notice] = 'Borrado' if proposed_name.destroy
    respond_with proposed_name, location: proposed_names_path
  end

  def update
    flash[:notice] = 'Nombre guardado.' if proposed_name.update_attributes(params[:proposed_name])
    respond_with proposed_name
  end

end
