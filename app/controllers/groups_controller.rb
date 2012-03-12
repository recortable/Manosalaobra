class GroupsController < ApplicationController
  respond_to :html
  expose(:groups) { Group.all }
  expose(:group)

  def index
    authorize! :view, Group
    respond_with groups
  end

  def show
    authorize! :read, group
    respond_with group
  end

  def new
    authorize! :new, Group
    respond_with group
  end

  def edit
    authorize! :edit, group
    respond_with group
  end

  def create
    group.user = current_user
    authorize! :create, group
    flash[:notice] = 'Grupo creado' if group.save
    respond_with group
  end

  def update
    authorize! :update, group
    flash[:notice] = 'Grupo actualizado' if group.update_attributes(params[:group])
    respond_with group
  end

  def destroy
    authorize! :destroy, group
    group.destroy
    respond_with group
  end
end
