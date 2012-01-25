class CommentsController < ApplicationController
  
  respond_to :html, :json, :xml
  
  def create
    @comment = Comment.new(params[:comment])
    
    flash[:notice] = "Gracias por tu comentario!" if @comment.save
    
    respond_with @comment, location: @comment.post
  end
end
