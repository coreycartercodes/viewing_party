require 'rails_helper'

RSpec.describe Actor do
  it 'exists' do
    attr = {
      id: 1,
      name: 'Juan',
      character: 'Willie Juanka',
    }

    actor = Actor.new(attr)

    expect(actor).to be_an(Actor)
    expect(actor.id).to eq(1)
    expect(actor.name).to eq('Juan')
    expect(actor.character).to eq('Willie Juanka')
  end
end
