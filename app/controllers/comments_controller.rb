class CommentsController < ApplicationController
	def index
    if user_signed_in?
    	@p_id= (params[:id])
		@comments= Comment.where(:policy_id => @p_id)
		
  else
    redirect_to new_user_session_path
  end
	end

	def new
    if user_signed_in?
    	@pol_id = (params[:id])
		@comment = Comment.new
        @user = current_user
  else
    redirect_to new_user_session_path
  end
	end
	def create
		 @comment= Comment.new(comment_params)
		 if @comment.save
  		redirect_to comments_path(:id => @comment.policy_id),:notice => "comment created"
  		else
  			render 'new'
  		end
	end
	
def destroy
	@p_id = (params[:pid])
  @comment = Comment.find(params[:id]) 
  @comment.destroy
 
  redirect_to comments_path(:id => @p_id), :notice => "comment deleted"
end

 private

  def comment_params
  	params.require(:comment).permit(:body, :user, :policy_id)
  end
end
