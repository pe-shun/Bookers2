class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    @books = Book.all
    redirect_to books_path, notice:'Book was successfully created'
  end

  def index
     @book = Book.all
  end

  def show
     @book = Book.page(params[:page])
     @post_comment = PostComment.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to Book.all
  end


# 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:book_title, :caption)
  end

end
