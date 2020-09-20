class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/messages/#{comment.message.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, message_id: params[:message_id])
  end
end
