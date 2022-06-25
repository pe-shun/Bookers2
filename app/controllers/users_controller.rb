class UsersController < ApplicationController

def index
end

def show
end

def edit
end

def users
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

end
