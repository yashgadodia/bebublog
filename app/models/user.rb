class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy #if u delete a post it will delete all the comments. if u delete user it will delete all the comments lso =
  
  def username
    return self.email.split('@')[0].capitalize
  end

  def comment_created #method called in comment.rb
    self.number_of_comments = number_of_comments + 1 #increments the number of comments
    save #call save
    number_of_comments #return number of comments
  end
    

end
