class UsersController < ApplicationController
  # before_action :forbid_login_user, {only: [:name, :create, :login_form, :login]}
  before_action :authenticate_user!, {only: [:edit, :update,:index,:show]}
  # before_action :ensure_current_user, {only: [:edit, :update,:index,:show]}

  def show
    @user = User.find(params[:id])
    @user_images = @user.books
    @book=Book.new

    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end
  def index
    @book = Book.new
    @books=Book.all
    @users=User.all
    @user = current_user

    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end
  def edit
    @user = User.find(params[:id])
     unless @user.id == current_user.id
      redirect_to user_path(current_user)
     end
  end
def follows
  user = User.find(params[:id])
  @users = user.following_user.page(params[:page]).per(3).reverse_order

end

def followers
  user = User.find(params[:id])
  @users = user.follower_user.page(params[:page]).per(3).reverse_order

    
end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "Book was successfully created."
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

end
