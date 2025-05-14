  require "net/http"
  require "uri"
  require "json"

class Category < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :recipes, through: :bookmarks

  validates :name, uniqueness: true
  validates :name,length: { minimum: 1 }

  def fetch_image_for_category(category_name)
    uri = URI.parse("https://www.searchapi.io/api/v1/search")
    params = {
      engine: "google_images",
      q: "#{category_name} national dishes",
      api_key: "ahqkby6uwvzEpW5fLn65rJ2c"
    }
    uri.query = URI.encode_www_form(params)
    
    response = Net::HTTP.get(uri)
    results = JSON.parse(response)
    return results["images"][0]["original"]["link"]
  end
end

