class CommentsController < ApplicationController
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    
    if @comment.save
      redirect_to [@topic, @post], notice: 'Comment Saved'
    end
  end

  
  def destroy 
  	@topic = Topic.find(params[:topic_id])
  	@post = @topic.posts.find(params[:post_id])

  	@comment = @post.comments.find(params[:id])
  	authorize @comment
  	if @comment.destroy
  		flash[:notice] = "Comment was removed."
  		redirect_to [@topic, @post]
  	else
  		flash[:notice] = "Comment couldn't be deleted. Try again."
  		redirect_to [@topic, @post]
  	end
  end


private 

def comment_params
  params.require(:comment).permit(:body,:user_id, :post_id)
end

end