class VotesController < ApplicationController

  # TODO: quitar este comentario
  # Votes controller es un NESTED RESOURCE (mira routes.rb y la guía de rutas)
  # Eso significa que siempre recibirá un parámetro llamado proposed_name_id
  # MIRA LA GUIA Y TRATA DE ENTENDER LO QUE ES UNA NESTED ROUTE
  expose(:proposed_name) { ProposedName.find params[:proposed_name_id] }
  expose(:votes) { proposed_name.votes }
  expose(:vote)

  def create
    vote.value = params[:value] == '-1' ? -1 : 1
    vote.request_ip = request.remote_ip
    vote.save
    respond_to do |format|
      format.html { redirect_to proposed_names_path }
      format.js
    end
  end
end
