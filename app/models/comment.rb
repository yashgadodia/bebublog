class Comment < ApplicationRecord
  belongs_to :user
  before_create :set_comment_number #before a comment is created define this
  has_rich_text :body #use action text to set up comment body

  #polymorphic comments
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy

  private

  def set_comment_number
    self.comment_number = users.comment_created #create a new comment in here 
  end
end
