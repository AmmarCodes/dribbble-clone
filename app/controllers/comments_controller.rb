class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_shot, only: %i[create destroy]

  def create
    puts comment_params
    @comment = @shot.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save!

    redirect_to @shot
  end

  def destroy
    @comment = @shot.comments.find(params[:id])
    @comment.destroy
    redirect_to @shot
  end

  private

  def set_shot
    @shot = Shot.find(params[:shot_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
