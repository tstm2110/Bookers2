class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
	  @books=@book.book_comments

		@book_comment = BookComment.new(book_comment_params)
		@book_comment.book_id = @book.id
		@book_comment.user_id = current_user.id
		if @book_comment.save

		else
    @users=User.all
    @user =@book.user
    @bookkara=Book.new
		  render 'books/show'
		end
  end

  def destroy
  	@book = Book.find(params[:book_id])

  	@books=@book.book_comments

		@book_comment = BookComment.new
  	book_comment = @book.book_comments.find(params[:id])
		book_comment.destroy

  end
  private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
