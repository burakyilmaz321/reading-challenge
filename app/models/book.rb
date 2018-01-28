class Book < ApplicationRecord
  belongs_to :author
  has_many :users, through: :reading
end
