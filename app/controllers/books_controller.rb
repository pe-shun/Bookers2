class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path, notice:'Book was successfully created'
  end

  def index
     @book = Book.new
     @books = Book.all
     @user = current_user
  end

  def show
     @book = Book.find(params[:id])
     @post_comment = PostComment.new
     @newbook = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to Book.all
  end


# 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:body, :title)
  end

end
