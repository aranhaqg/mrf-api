class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[A-Za-z0-9._%+-]+@fab.mil.br/, message: "Email invalid"  },
    length: { minimum: 4, maximum: 254 }         
end
