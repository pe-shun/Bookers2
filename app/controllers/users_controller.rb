class UsersController < ApplicationController

def index
   @user = Users.all
end

def show
 @user = User.find(params[:id])
end

def edit
  @user = User.find(params[:id])
end

def users
  @user = User.find(params[:id])
  @users = Users.all
end

def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice:'You have updated user successfully.'
    else
      render :"/users/:id"
    end
end

 def create
    @user = User.new(book_params)
    @user.user_id = current_user.id
    @user.save
    @user = User.all
    redirect_to books_path, notice:'Book was successfully created'
 end

# 投稿データのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end


end
