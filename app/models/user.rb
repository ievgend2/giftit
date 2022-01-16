class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { in: 3..10 }
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  has_many :posts, dependent: :destroy
  has_many :messages, dependent: :destroy
  #has_many :conversations, dependent: :destroy

end
