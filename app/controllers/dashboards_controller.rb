class DashboardsController < ApplicationController
  expose(:names) { ProposedName.limit(5) }
  expose(:posts) { Post.order('id ASC').limit(5) }
  def show

  end
end