class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
          validates :password, length: { minimum: 6 }, format: { with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input full-width characters."}
          validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
          validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
          validates :furigana_first_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width characters."}
          validates :furigana_last_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width characters."}
        end
end
