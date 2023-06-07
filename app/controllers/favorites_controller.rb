class FavoritesController < ApplicationController
def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to pictures_path, notice: "#{favorite.picture.user.name}さんの投稿をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_path, notice: "#{favorite.picture.user.name}さんの投稿をお気に入り解除しました"
  end
end
