class Reading < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :month, presence: true, inclusion: {
    in: @months = %w(January February March April May June
                     July August September October November December)
  }
  validates :status, inclusion: {in: %w(Reading Done)}
  accepts_nested_attributes_for :book
end
