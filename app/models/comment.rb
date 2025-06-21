class Comment < ApplicationRecord
  belongs_to :Post
  belongs_to :Author
  belongs_to :parent_comment
end
