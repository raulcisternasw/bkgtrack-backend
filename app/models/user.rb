class User < ApplicationRecord
  validates :email, :first_name, :last_name, :gender, presence: true
end
