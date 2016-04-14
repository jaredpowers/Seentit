class Post < ActiveRecord::Base
  WillPaginate.per_page = 10
  belongs_to :user

  has_many :upvotes
  has_many :downvotes
  has_many :comments

  validates :title, presence: true

  def upvote
    upvotes.count + 1
  end

  def downvote
    downvotes.count + 1
  end

  def upvote_count
    upvotes.count
  end

  def downvote_count
    downvotes.count
  end

  def score
    upvotes.count - downvotes.count
  end

end
