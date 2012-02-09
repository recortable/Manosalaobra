class Post < Content
  
  has_many :comments, dependent: :delete_all
  
end
