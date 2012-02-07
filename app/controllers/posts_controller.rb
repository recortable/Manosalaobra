# encoding: utf-8
class PostsController < ApplicationController
  respond_to :html, :json, :xml
  expose(:posts) { Post.all }
  expose(:post)

  def index
    respond_with posts
  end

  def show
    respond_with post
  end

  def new
    authorize! :create, Post
    respond_with post
  end

  def create
    authorize! :create, Post
    flash[:notice] = "Se ha guardado! Bien!" if post.save
    respond_with post
  end

  def edit
    authorize! :edit, Post
    respond_with post
  end

  def update
    authorize! :edit, Post
    flash[:notice] = 'Actualizado, ¡gracias!' if post.update_attributes params[:post]
    respond_with post
  end

  def destroy
    authorize! :delete, Post
    flash[:notice] = 'Borrado' if post.destroy
    respond_with post, location: posts_path
  end
end
