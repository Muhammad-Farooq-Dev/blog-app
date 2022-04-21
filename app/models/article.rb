# frozen_string_literal: true

# articles class
class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: { message: ' cannot be empty'}
  validates :name, presence: { message: ' cannot be empty'}
end
