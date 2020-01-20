class User < ApplicationRecord
    validates :name, presence: true, length: {maximum: 50}
    validates :idnum, presence: true, :length => { :is => 6 }, uniqueness: true
    validates :mobilenum, presence: true, :length => { :is => 10 }, uniqueness: true

    has_secure_password
    validates :password, length: { minimum: 6}
end
