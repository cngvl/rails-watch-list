class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to lists_path(@bookmark), notice: 'bookmark was successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    # raise
    @list = List.find(params[:list_id])
    # redirect_to lists_path(@bookmark.list), notice: 'bookmark was successfully deleted!'
    redirect_to list_path(@list), notice: 'bookmark was successfully deleted!'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
