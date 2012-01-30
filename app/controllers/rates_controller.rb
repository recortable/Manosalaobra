# encoding: utf-8
class RatesController < ApplicationController
  respond_to :html, :json, :xml
  expose(:rate)
  
  def create
    flash[:notice] = "¡Gracias por tu valoración!" if rate.save
    
    respond_with rate, location: rate.post
  end
end
