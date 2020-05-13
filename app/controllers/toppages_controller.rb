class ToppagesController < ApplicationController
  def index
    # urlにcategory_id(params)がある場合
    if params[:color_id]
      # Categoryのデータベースのテーブルから一致するidを取得
      @color = Color.find(params[:color_id])
       
      # category_idと紐づく投稿を取得
      @artworks = @color.artworks.order(created_at: :desc).all
    else
      # 投稿すべてを取得
      @artworks = Artwork.order(created_at: :desc).all
    end
  end

end
