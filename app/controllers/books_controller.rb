class BooksController < ApplicationController


 # 投稿データの保存
  def create

    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if @book.save
  flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
  else

     @users=User.all
     @books=Book.all
     @user =current_user
      @following_users = @user.following_user
    @follower_users = @user.follower_user
    render :index

  end
  end

  def edit

    @book = Book.find(params[:id])
  if @book.user != current_user

      redirect_to books_path
  end
  end

  def index
    @book = Book.new
    @books=Book.all
    @users=User.all
    @user =current_user
   @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  def show
    @bookkara=Book.new
    @book = Book.find(params[:id])
    @books=@book.book_comments
    @users=User.all
    @user =@book.user
    @book_comment = BookComment.new
     @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def update
     @following_users = @user.following_user
    @follower_users = @user.follower_user

    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
    else

     @users=User.all
     @books=Book.all
     @user =current_user
    render  :index
    #edit
    end
  end
def search
  @books = Book.search(params[:keyword])
  @keyword = params[:keyword]
  render:index
end
   # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
