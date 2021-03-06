class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    artwork = Artwork.find(params[:artwork_id])
    current_user.like(artwork)
    flash[:success] = 'お気に入りに追加しました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    artwork = Artwork.find(params[:artwork_id])
    current_user.unlike(artwork)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
