require 'rails_helper'

describe Friendship, type: :model do
    describe 'relationships' do
        it {should belong_to :user}
        it {should belong_to :friend}
    end

    describe 'Validations' do
        xit { should validate_uniqueness_of(:friend).scoped_to(:user).case_insensitive }
    end

    describe 'check_user' do
        it 'keeps user from friending self' do
            user = create :user            
            expect { user.friends << user }.to raise_error(ActiveRecord::RecordInvalid)
        end
    end
end