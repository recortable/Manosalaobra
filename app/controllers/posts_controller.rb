# encoding: utf-8
class PostsController < ContentsController
  expose(:summary_names) { ProposedName.limit(6).order("votes_value DESC") }
  expose(:posts) { Post.all }
  expose(:post)
  expose(:content) { post }

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

  def edit
    authorize! :edit, post
    respond_with post
  end

  def create
    authorize! :create, post
    post.user_id = current_user.id
    flash[:notice] = "Se ha guardado! Bien!" if post.save
    respond_with post
  end

  def update
    authorize! :edit, content
    flash[:notice] = 'Actualizado, ¡gracias!' if content.update_attributes params[:post]
    respond_with post
  end

  def destroy
    authorize! :delete, content
    flash[:notice] = 'Borrado' if content.destroy
    respond_with post, location: posts_path
  end
end
