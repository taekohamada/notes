class Note < ApplicationRecord
  has_many :posts
  has_many :users, through: :user_notes
  has_many :user_notes
#   accepts_nested_attributes_for :user_notes
# end

end
