class ParticipantsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @participant = Participant.new(idea_id: params[:idea_id])
    @participant.user = current_user
    @participant.save
    redirect_to idea_path(params[:idea_id])
  end

  def edit
  end

  def update
  end

  def destroy
    @participant = Participant.find_by(idea_id: params[:idea_id], user: current_user).destroy
    redirect_to idea_path(params[:idea_id])
  end
end
