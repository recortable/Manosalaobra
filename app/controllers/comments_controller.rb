class CommentsController < ApplicationController
  respond_to :html, :json, :xml
  expose(:comment)
  
  def create    
    flash[:notice] = "Gracias por tu comentario!" if comment.save
    
    respond_with comment, location: comment.post
  end
end
