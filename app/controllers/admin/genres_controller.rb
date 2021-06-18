class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def create
    genre = Genre.new(genre_params)
    if genre.save
    # 編集画面へ遷移
      redirect_to edit_admin_genre_path(genre.id)
    else
    redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      # 一覧画面へ遷移
      redirect_to admin_genres_path
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  
  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
