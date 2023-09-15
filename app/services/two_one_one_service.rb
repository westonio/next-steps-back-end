class TwoOneOneService

  def search(keyword, location)
    get_url("Search/Keyword?Keyword=#{keyword}&Location=#{location}&Distance=10", keyword)
  end

  def get_url(url, keyword)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.211.org/search/v1/api/") do |faraday|
      faraday.headers["Api-Key"] = Rails.application.credentials.my_api_key[:primary_key]
    end
  end
end
