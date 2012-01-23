class PostsController < ApplicationController

  respond_to :html, :json, :xml
  def index
    @posts = Post.all
    respond_with @posts
  end

  def show
    @post = Post.find params[:id]
    respond_with @post
  end

  def new
    @post = Post.new
    respond_with @post
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Se ha guardado! Bien!"
    end
    respond_with @post
  end
  
  def edit
    @post = Post.find params[:id]
    respond_with @post
  end
  
  def update
    @post = Post.find params[:id]
    @post.update_attributes params[:post]
    respond_with(@post)
  end

end
