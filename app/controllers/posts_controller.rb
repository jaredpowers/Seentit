class PostsController < ApplicationController

  def index
    all_posts = Post.all.sort_by { |l| [l.score, l.title] }.reverse!

    current_page = params[:page].to_i

    if current_page <= 1
      start_number = 0
      end_number = 10
    else
      start_number = current_page + 10
      end_number = current_page * 10
    end

    @posts = all_posts[start_number..end_number]
  end

  def show
    post = Post.find(params[:id])
    if post
      @post = post
    else
      render_not_found
    end
  end

  def create
    Post.create(user_id: params[:post][:user_id],
                title: params[:post][:title],
                body: params[:post][:body])

    redirect_to '/posts'
  end

  private

  def render_not_found
    render template: 'posts/not_found.html.erb'
  end

end
