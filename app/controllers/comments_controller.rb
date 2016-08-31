class CommentsController < ApplicationController
  def create
    todo = Todo.find(params[:todo_id])
    comment = todo.comments.new(comment_params)
    comment.user = current_user
    comment.create_event(current_user, '回复了任务') if comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
