class UpvotesController < ApplicationController
  def index
    @upvote = Upvote.all
  end

  def create_upvote
    @upvote = Upvote.new
    @upvote.post = Post.find(params[:post_id])
    @upvote.save
    redirect_to :back
  end
end
