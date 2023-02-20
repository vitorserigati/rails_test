# frozen_string_literal: true

class User < ActiveRecord::Base
  has_one :wallet, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable
  include DeviseTokenAuth::Concerns::User
  validates :name, presence: true

  before_validation :set_uid
  after_create :create_wallet

  private

  def set_uid
    self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
  end
end
