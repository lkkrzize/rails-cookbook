class Category < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :recipes, through: :bookmarks

  validates :name, uniqueness: true
  validates :name,length: { minimum: 1 }
end
