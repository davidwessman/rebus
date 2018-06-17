class Post < ApplicationRecord
  has_many(:questions)

  def to_s
    title
  end
  
  def to_param
    slug || id
  end
end
