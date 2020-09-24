class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, uniqueness: true, presence: true
         validates :email, uniqueness: true, presence: true
         validates :encrypted_password, length: { minimum: 6 }, presence: true
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :furigana_first_name, presence: true
         validates :furigana_last_name, presence: true
         validates :birthday, presence: true
end
