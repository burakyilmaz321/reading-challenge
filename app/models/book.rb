class Book < ApplicationRecord
  belongs_to :author
  has_many :readings
  has_many :users, through: :readings

  accepts_nested_attributes_for :author
end
