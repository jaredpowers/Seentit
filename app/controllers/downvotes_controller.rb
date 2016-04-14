class DownvotesController < ApplicationController

  def index
    @downvote = Downvote.all
  end

  def create_downvote
    @downvote = Downvote.new
    @downvote.post = Post.find(params[:post_id])
    @downvote.save
    redirect_to :back
  end

end
