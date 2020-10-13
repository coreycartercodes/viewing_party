require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    attr = {
      id: 1,
      title: 'Its a Juanderful Life',
      vote_average: 10,
      runtime: 253,
      overview: 'When Juan and Juanita meet its like love at first sight',
    }

    movie = Movie.new(attr)

    expect(movie).to be_a(Movie)
    expect(movie.movie_id).to eq(1)
    expect(movie.title).to eq('Its a Juanderful Life')
    expect(movie.vote_avg).to eq(10)
    expect(movie.runtime).to eq(253)
    expect(movie.summary).to eq('When Juan and Juanita meet its like love at first sight')

    expect(movie.formatted_runtime).to eq('4 hour(s) and 13 minutes')
  end
end
