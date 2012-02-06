# encoding: utf-8
class NamesController < ApplicationController
  respond_to :html, :json, :xml
  expose(:names) { Name.all }
  expose(:name)
  
  def index
    respond_with names
  end
  
  def new
    respond_with name
  end

  def create
    flash[:notice] = "Se ha guardado ¡Bien!" if name.save
    respond_with name, location: names_path
  end
  
  def destroy
    flash[:notice] = 'Borrado' if name.destroy
    respond_with name, location: names_path
  end
  
  def update
  end
  
end
