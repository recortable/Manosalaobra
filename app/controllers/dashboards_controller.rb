class DashboardsController < ApplicationController
  expose(:posts) { Post.order('id ASC').limit(5) }
  expose(:page) { Page.where(id: 1).first || Page.new }

  def show
  end

  def wip
  end
end