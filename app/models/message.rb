class Message < ApplicationRecord
  has_secure_token :auth_token
  validates :content, presence: true
  validates :email_address, presence: true
end
