require 'rails_helper'

RSpec.describe Genre do
  it 'exists' do
    attr = {
      id: 1,
      name: 'Comedy',
    }

    genre = Genre.new(attr)

    expect(genre).to be_an(Genre)
    expect(genre.id).to eq(1)
    expect(genre.name).to eq('Comedy')
  end
end
