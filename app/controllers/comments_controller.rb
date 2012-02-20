# encoding: utf-8
class CommentsController < ApplicationController
  respond_to :html, :json, :xml

  # Hay que poner el prural para que funcione el singular
  expose(:comments)
  expose(:comment)

  def create
    comment.post = Content.find(params[:post_id])
    flash[:notice] = "Gracias por tu comentario!" if comment.save
    respond_with comment, location: comment.post
  end
  
  def edit
    authorize! :edit, Comment
    respond_with comment
  end
  
  def update
    authorize! :edit, Comment
    flash[:notice] = 'El comentario ha sido actualizado ¡gracias!' if comment.update_attributes params[:comment]
    respond_with comment, location: post_path(comment.post)
  end
  
  def destroy
    authorize! :delete, Comment
    flash[:notice] = 'Borrado' if comment.destroy
    respond_with comment, location: post_path(comment.post)
  end
end
