class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path(@book.id), notice:'Book was successfully created'
    else
    @user = current_user
    @books = Book.all
      render :index
    end
  end

  def update
     @book = Book.find(params[:id])
     @book.update(book_params)
     redirect_to edit_book_path
  end

  def index
     @book = Book.new
     @books = Book.all
     @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def show
     @book = Book.find(params[:id])
     @newbook = Book.new
     @user = User.find(@book.user_id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


# 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:body, :title)
  end

  def set_current_user
    @book = Book.find(params[:id])
    if current_user != @book.user
      redirect_to "/books"
    end
  end

end
