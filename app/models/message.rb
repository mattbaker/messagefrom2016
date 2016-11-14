class Message < ApplicationRecord
  has_secure_token :auth_token
end
