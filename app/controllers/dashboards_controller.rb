class DashboardsController < ApplicationController
  expose(:names) { ProposedName.limit(5) }
  expose(:posts) { Post.order('id ASC').limit(5) }
  expose(:page) { Page.where(id: 1).first || Page.new }

  def show

  end

  # WIP: work in progress
  def wip
  end
end