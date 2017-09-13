class Post < ApplicationRecord

  belongs_to :notes
  has_many :users
end
