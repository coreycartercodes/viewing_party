class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates :friend, uniqueness: { scope: :user }
  validate :check_user
  def check_user
    errors.add(:friend, "can't be yourself") if friend_id == user_id
  end
end
