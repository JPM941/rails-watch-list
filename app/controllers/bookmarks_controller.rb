class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[show destroy]
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to @list, notice: "bookmark was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path, notice: "bookmark was successfully destroyed."
  end
  
  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  # Only allow a bookmark of trusted parameters through.
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
