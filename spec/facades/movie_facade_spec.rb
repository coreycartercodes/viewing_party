require 'rails_helper'

RSpec.describe 'movie facade' do
  it 'fetches movie index data for search by title' do
    VCR.use_cassette('happy_movie_search_3') do
      @movies = MovieFacade.find('Hello')
      expect(@movies).to be_a(Array)
      expect(@movies.count).to eq(40)
    end
  end

  it 'fetches movie details data' do
    VCR.use_cassette('movie_details_2') do
      @movie_details = MovieFacade.movie_details(500)
      expect(@movie_details).to be_a(Movie)
      expect(@movie_details.title).to eq('Reservoir Dogs')
      expect(@movie_details.movie_id).to eq(500)
      expect(@movie_details.vote_avg).to eq(8.2)
      expect(@movie_details.runtime).to eq(99)
      expect(@movie_details.summary).to be_a(String)
      expect(@movie_details.genres).to be_a(Array)
    end
  end
  it 'fetches movie trailer key' do
    VCR.use_cassette('movie_trailer_1') do
      @movie_trailer_key = MovieFacade.get_trailer(5)
      expect(@movie_trailer_key).to be_a(String)
      expect(@movie_trailer_key).to eq('S_Pd2pGkq54')
    end
  end
  it 'fetches top 40 movies' do
    VCR.use_cassette('top_40_num_2') do
      @top_40 = MovieFacade.top_40

      expect(@top_40).to be_an(Array)
      expect(@top_40.first).to be_a(Movie)
    end
  end
  it 'fetches movie details for party' do
    VCR.use_cassette('party_details') do
      @details = MovieFacade.movie_details_for_party(5)

      expect(@details).to be_a(Movie)
    end
  end
end
