class IdeasController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_idea, only: %i[show edit update destroy]
  def index
    @ideas = Idea.order(created_at: :desc)
  end

  def show
    @comment = Comment.new
    @participant = Participant.find_by(idea: @idea, user: current_user)
    @all_interested_participants = Participant.where(idea_id: @idea)
  end

  def new
    @idea = Idea.new
    @tags = ActsAsTaggableOn::Tag.all.order('name').map{ |tag| tag.name }
  end

  def edit
    @user = current_user
  end

  def create
    @idea = Idea.new(idea_params)
    @user = current_user
    @idea.user = @user
    if @idea.save
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def update
    if @idea.update(idea_params)
      redirect_to idea_path(@idea), notice: "Figma link was added"
    else
      render :show, notice: "Couldn't add a proper link"
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path, notice: "Your idea has been deleted"
  end

  def figma
    @idea = Idea.find(params[:idea_id])
    @user = current_user
  end

  def github
    @idea = Idea.find(params[:idea_id])
    @user = current_user
  end

  private

  def idea_params
    params.require('idea').permit(
      :title,
      :description,
      :figma_link,
      :github_link,
      :pain,
      :target,
      :solution,
      :originality,
      tag_list: [],
      photos: []
    )
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
end
