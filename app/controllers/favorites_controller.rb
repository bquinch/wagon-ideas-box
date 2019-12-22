class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new()
    @favorite.user = current_user
    @favorite.idea = Idea.find(params[:idea_id])
    if @favorite.save
      respond_to do |format|
        format.html { redirect_to idea_path(params[:idea_id]) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'ideas/show' }
        format.js
      end
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to idea_path(@favorite.idea_id), notice: "Removed from favorites"
  end
end
