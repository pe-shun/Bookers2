class UsersController < ApplicationController

def index
 @book = Book.new
 @users = User.all
 @user = current_user
end

def show
 @user = User.find(params[:id])
 @newbook = Book.new
 @books = @user.books
end

def edit
  @user = User.find(params[:id])
end

def users
  @user = User.find(params[:id])
  @users = User.all
end

def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice:'You have updated user successfully.'
    else
      render :edit
    end
end

 def create
    @user = User.new(book_params)
    @user.user_id = current_user.id
    if @user.save
      redirect_to books_path, notice:'You have create book successfully.'
    else
      render :new
    end
 end

 def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to Book.all
 end

# 投稿データのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

  def set_current_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to users_path
    end
  end

end
