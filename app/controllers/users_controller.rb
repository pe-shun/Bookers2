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

end
