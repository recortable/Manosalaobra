class MediaItemsController < ApplicationController
  before_filter :require_user
  respond_to :html, :json

  expose(:media_items) { MediaItem.all }
  expose(:media_item)

  def index
    respond_with media_items
  end

  def show
    authorize! :view, media_item
    respond_with media_item
  end

  def edit
    authorize! :update, media_item
    respond_with media_item
  end

  def new
    authorize! :create, media_item
    respond_with media_item
  end

  def create
    authorize! :create, media_item
    flash[:notice] = 'Guardado' if media_item.save
    respond_with media_item
  end

  def update
    authorize! :update, media_item
    flash[:notice] = 'Guardado' if media_item.update_attributes(params[:media_item])
    respond_with media_item
  end
end