class DashboardsController < ApplicationController
  # Problems dashboard
  expose(:phases) { Phase.all }
  def problems

  end

  expose(:summary_names) { ProposedName.limit(6).order("votes_value DESC") }
  expose(:posts) { Post.order('id ASC').limit(5) }
  expose(:page) { Page.where(id: 1).first || Page.new }
  def show
  end

  def wip
  end
end
