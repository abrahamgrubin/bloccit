class CommentsController < ApplicationController
  def create
    redirect_to @comment
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

end

