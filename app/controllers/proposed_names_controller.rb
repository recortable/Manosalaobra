# encoding: utf-8
class ProposedNamesController < ApplicationController
  respond_to :html, :json, :xml
  expose(:proposed_names) { ProposedName.all }
  expose(:proposed_name)

  layout "without_content_top"
  
  def index
    respond_with proposed_names
  end
  
  def new
    respond_with proposed_names
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
  end
  
end
