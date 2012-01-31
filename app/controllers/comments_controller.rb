class CommentsController < ApplicationController
  respond_to :html, :json, :xml

  # Hay que poner el prural para que funcione el singular
  expose(:comments)
  expose(:comment)

  def create
    flash[:notice] = "Gracias por tu comentario!" if comment.save
    respond_with comment, location: comment.post
  end
end
