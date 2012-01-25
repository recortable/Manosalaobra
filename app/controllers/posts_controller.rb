# encoding: utf-8
class PostsController < ApplicationController
  respond_to :html, :json, :xml
  expose(:posts) { Post.all }
  expose(:post)
  expose(:comment) { Comment.new(post_id: post) }

  def index
    respond_with posts
  end

  def show
    respond_with post
  end

  def new
    respond_with post
  end

  def create
      flash[:notice] = "Se ha guardado! Bien!" if post.save
    respond_with post
  end

  def edit
    respond_with post
  end

  def update
    flash[:notice] = 'Actualizado, ¡gracias!' if post.update_attributes params[:post]
    respond_with post
  end

  def destroy
    flash[:notice] = 'Borrado' if post.destroy
    respond_with post, location: posts_path
  end
end
