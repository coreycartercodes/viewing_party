require 'rails_helper'

RSpec.describe Review do
  it 'exists' do
    attr = {
      id: 1,
      author: 'Juanita',
      content: 'this is a review'
    }

    review = Review.new(attr)

    expect(review).to be_an(Review)
    expect(review.id).to eq(1)
    expect(review.author).to eq('Juanita')
    expect(review.content).to eq('this is a review')
  end
end
