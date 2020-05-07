class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :commentable, dependent: :destroy


  #active storage from rails 5
  # has_one_attached :thumbnail #macro sets up one-to-one mapping between records and files. each record can have one file attached to it
  # has_one_attached :banner
  #action text from rails 6
  has_rich_text :body

  #do some validations
  validates :title, length: { minimum: 5 }
  validates :body,  length: { minimum: 25 }

  self.per_page = 10
  extend FriendlyId
  friendly_id :title, use: :slugged

  #what is this exactly
  def optimized_image(image,x,y)
    return image.variant(resize_to_fill: [x, y]).processed
  end

end

