class TwoOneOneService

  def self.search(keyword, location)
    get_url("Search/Keyword?Keyword=#{keyword}&Location=#{location}&Distance=10")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:results].map do |data|
      FilteredResults.new(data) 
    end
  end

  def self.conn
    Faraday.new(url: "https://api.211.org/search/v1/api/") do |faraday|
      faraday.headers["Api-Key"] = Rails.application.credentials.my_api_key[:primary_key]
    end
  end
end