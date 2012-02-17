class DashboardsController < ApplicationController
  expose(:posts) { Post.order('id ASC').limit(5) }
  expose(:page) { Page.where(id: 1).first || Page.new }

  layout "wip_layout", only: :wip

  def show

  end

  # WIP: work in progress
  def wip
  end
end