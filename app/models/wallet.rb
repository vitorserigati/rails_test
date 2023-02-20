class Wallet < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true, uniqueness: true

  after_create :save
end
