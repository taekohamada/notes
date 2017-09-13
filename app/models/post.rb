class Post < ApplicationRecord

  belongs_to :notes
  belongs_to :user
end
