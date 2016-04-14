class CommentsController < ApplicationController
  def index
    @comments = Comment.new
  end

  def show
    comment = find_comments_by_id

    if comment
      @comment = comment
    else
      render_not_found
    end
    redirect_to '/posts'
  end

  private

  def find_comments_by_id
    Comment.find(params[:post_id].to_i)
  end

end
