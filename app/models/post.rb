class Post < Content
  
  has_many :comments, dependent: :delete_all
  belongs_to :user

  default_scope { order("created_at DESC") }
  
end
