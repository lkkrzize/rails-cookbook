    require "net/http"
    require "uri"
    require "json"

module CategoriesHelper

  def fetch_image_for_category(category_name)



    # uri = URI.parse("https://www.searchapi.io/api/v1/search")
    # params = {
    #   engine: "google_images",
    #   q: "#{category_name} national dishes",
    #   api_key: "ahqkby6uwvzEpW5fLn65rJ2c"
    # }
    # uri.query = URI.encode_www_form(params)

    # response = Net::HTTP.get(uri)
    # results = JSON.parse(response)

    # return results["images"][0]["original"]["link"]

    return "https://raw.githubusercontent.com/lewagon/fullstack-images/master/uikit/breakfast.jpg"
  end

end
