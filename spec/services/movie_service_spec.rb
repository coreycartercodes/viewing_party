require 'rails_helper'

RSpec.describe MovieService do
  it 'fetches movie index data for search by title' do
    VCR.use_cassette('happy_movie_search_2') do
      @movies = MovieService.find_title('Hello')
      expect(@movies).to be_an(Array)
      expect(@movies.count).to eq(40)
    end
  end
  it 'fetches top 40 movies' do
    VCR.use_cassette('top_40_num_3') do
      @movies = MovieService.find_top_40
      expect(@movies).to be_an(Array)
      expect(@movies.first).to be_a(Hash)
      expect(@movies.count).to eq(40)
    end
  end
  it 'fetches reviews' do
    VCR.use_cassette('movie_reviews') do
      @reviews = MovieService.get_reviews(550)
      expect(@reviews).to be_an(Array)
      expect(@reviews.first).to be_a(Hash)
      expect(@reviews.count).to eq(2)
    end
  end
  it 'fetches cast' do
    VCR.use_cassette('movie_cast') do
      @cast = MovieService.get_cast(550)
      expect(@cast).to be_an(Array)
      expect(@cast.first).to be_a(Hash)
      expect(@cast.count).to eq(10)
    end
  end

  it 'fetches movie details data' do
    VCR.use_cassette('movie_details') do
      @movie_details = MovieService.get_details(500)
      expect(@movie_details).to be_a(Hash)
      expect(@movie_details[:title]).to eq('Reservoir Dogs')
      expect(@movie_details[:id]).to eq(500)
      expect(@movie_details[:vote_average]).to eq(8.2)
      expect(@movie_details[:runtime]).to eq(99)
      expect(@movie_details[:overview]).to be_a(String)
      expect(@movie_details[:genres]).to be_a(Array)
    end
  end
  it 'fetches movie trailer key' do
    VCR.use_cassette('movie_trailer') do
      @movie_trailer_key = MovieService.get_trailer(5)
      expect(@movie_trailer_key).to be_a(String)
      expect(@movie_trailer_key).to eq('S_Pd2pGkq54')
    end
  end
end
