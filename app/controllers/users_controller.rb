class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    user = find_user_by_id

      if user
        @user = user
        @posts = @user.posts
      else
        render_not_found
      end
  end

  private

  def find_user_by_id
    User.find(params['id'].to_i)
  end

  def render_not_found
    render template: "/users/not_found.html.erb"
  end

end
