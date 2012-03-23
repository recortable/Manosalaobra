# encoding: utf-8
class PagesController < ContentsController
  before_filter :require_user, except: [:show]
  expose(:pages) { Page.all }
  expose(:page)
  expose(:content) { page }

  def index
    respond_with pages
  end

  def show
    respond_with page
  end

  def new
    authorize! :create, page
    respond_with page
  end

  def edit
    authorize! :edit, page
    respond_with page
  end

  def create
    authorize! :create, content
    flash[:notice] = "Se ha guardado! Bien!" if page.save
    respond_with page
  end

  def update
    authorize! :edit, content
    flash[:notice] = 'Actualizado, ¡gracias!' if page.update_attributes params[:page]
    respond_with page
  end

  def destroy
    authorize! :delete, content
    flash[:notice] = 'Borrado' if content.destroy
    respond_with page, location: pages_path
  end
end
