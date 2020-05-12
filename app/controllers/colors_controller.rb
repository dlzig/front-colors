class ColorsController < ApplicationController
  def index
  end
  
  def show
    @color = Color.find(params[:id])
    @artworks = @color.artworks.order(id: :desc)
  end
end
