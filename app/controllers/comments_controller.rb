class CommentsController < ApplicationController
	def new
		@comment = Comment.new(user_id: params[:user_id], product_id: params[:product_id])
	end

	def create
		@comment = Comment.create(comment_params)

		if @comment.save
			redirect_to product_path(@comment.product)
		else
			flash.now[:error] = @comment.errors.messages
			render  'new'
		end
	end

	def edit; end

	def update
		    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = 'Comment successfully updated!'
    else
      flash[:danger] = 'Something wrong, sorry!'
    end
    redirect_to product_path(@product)
	 end

	private

	def comment_params
		params.require(:comment).permit(:user_id, :product_id, :body, :rating)
	end
end
