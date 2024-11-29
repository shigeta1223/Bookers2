class UsersController < ApplicationController
before_action :is_matching_login_user, only: [ :edit, :update ]
def show
  @book =Book.new
  @user = User.find(params[:id])
  @user_books = @user.books
  @book_user = @user # 記事の投稿者情報を取得
end

def edit
  @user = User.find(params[:id])
end
def update
  @user = User.find(params[:id])
  if @user.update(user_params)
  flash[:notice] = "You have updated user successfully."
  redirect_to user_path(@user)  
  else
    render 'edit'
  end
end
def index
  @user = current_user
  @book = Book.new
  @users = User.all
end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end
def is_matching_login_user
  user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to user_path(current_user.id)
  end
end
end
