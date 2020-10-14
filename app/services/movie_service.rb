class MovieService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org')
  end

  def self.find_top_40
    page_n = 1
    movies_data = []
    2.times do
      connection = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=#{page_n}")
      movies_data << JSON.parse(connection.body, symbolize_names: true)[:results]
      page_n += 1
    end
    movies_data.flatten
  end

  def self.find_title(title)
    page_n = 1
    movies_data = []
    2.times do
      connection = conn.get("/3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&language=en&query=#{title}&page=#{page_n}")
      movies_data << JSON.parse(connection.body, symbolize_names: true)[:results]
      page_n += 1
    end
    movies_data.flatten
  end

  def self.get_details(movie_id)
    connection = conn.get(
      "/3/movie/#{movie_id}?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US"
    )
    JSON.parse(connection.body, symbolize_names: true)
  end

  def self.get_reviews(movie_id)
    page_n = 1
    reviews_data = []
    until page_n > find_total_review_pages(movie_id)
      connection = conn.get("3/movie/#{movie_id}/reviews?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=#{page_n}")
      reviews_data << JSON.parse(connection.body, symbolize_names: true)[:results]
      page_n += 1
    end
    reviews_data.flatten
  end

  def self.find_total_review_pages(movie_id)
    init_connection = conn.get(
      "3/movie/#{movie_id}/reviews?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=1"
    )
    JSON.parse(init_connection.body, symbolize_names: true)[:total_pages]
  end

  def self.get_cast(movie_id)
    connection = conn.get(
      "/3/movie/#{movie_id}/credits?api_key=#{ENV['MOVIE_API_KEY']}"
    )
    JSON.parse(connection.body, symbolize_names: true)[:cast].take(10)
  end

  def self.get_trailer(movie_id)
    connection = conn.get(
      "/3/movie/#{movie_id}/videos?api_key=#{ENV['MOVIE_API_KEY']}"
    )
    JSON.parse(connection.body, symbolize_names: true)[:results].last[:key]
  end
end
