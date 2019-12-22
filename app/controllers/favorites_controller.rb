class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new()
    @favorite.user = current_user
    @favorite.idea = Idea.find(params[:idea_id])
    @favorite.save
    redirect_to idea_path(params[:idea_id])
  end

  def destroy
    @favorites = Favorite.where(user_id: current_user.id, idea_id: params[:idea_id])
    @favorites.destroy_all
    redirect_to idea_path(params[:idea_id]), notice: "Removed from favorites"
  end
end
