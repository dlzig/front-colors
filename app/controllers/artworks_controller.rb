class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]
  def index
    @artworks = Artwork.all
  end

  def show
  end
  
  def new
    @artwork = Artwork.new
  end

  def edit
  end
  
  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      flash[:success] = 'Message が正常に投稿されました'
      redirect_to @artwork
    else
      flash.now[:denger] = 'Message が正常に投稿されませんでした'
      render :new
    end
  end
  
  def update
    if @artwork.save
      flash[:success] = 'Message が正常に投稿されました'
      redirect_to @artwork
    else
      flash.now[:denger] = 'Message が正常に投稿されませんでした'
      render :new
    end
  end

  def destroy
    @artwork.destroy

    flash[:success] = 'Message は正常に削除されました'
    redirect_to artworks_url
  end


  private

  def set_artwork
    @artwork = Artwork.find(params[:id])
  end
  
  # Strong Parameter
  # Never trust parameters from the scary internet, only allow the white list through.
  def artwork_params
    params.require(:artwork).permit(:content, :title)
  end
  
end