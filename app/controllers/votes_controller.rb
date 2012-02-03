class VotesController < ApplicationController
  respond_to :html, :json, :xml
  expose(:votes) { Votes.all }
  expose(:vote)
  
  def new
    respond_with vote
  end
  
  def create
    
  end
end
