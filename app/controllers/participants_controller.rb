class ParticipantsController < ApplicationController
  def index
    @participants = Participant.where(idea_id: params[:idea_id])
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
