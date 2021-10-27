class BooksController < ApplicationController


 # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if @book.save

    redirect_to books_path(@book.id)
  else
    render :new

  end


  end

  def edit
    @book = Book.find(params[:id])
  end

  def index
    @book = Book.new
    @books=Book.all
    @users=User.all
    @user =current_user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  def show
    @book = Book.find(params[:id])

    @users=User.all
    @user =current_user
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
     flash[:notice] = "Book was successfully created."
    redirect_to book_path(book)
    else
    render "edit"
    end
  end

   # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
