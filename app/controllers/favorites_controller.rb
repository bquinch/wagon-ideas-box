class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new()
    @favorite.user = current_user
    @favorite.idea = Idea.find(params[:idea_id])
    @favorite.save
    redirect_to idea_path(params[:idea_id])
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to idea_path(@favorite.idea_id), notice: "Removed from favorites"
  end
end
