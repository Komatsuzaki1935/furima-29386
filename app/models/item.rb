class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_from
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price,              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }, format: { with: /\A[0-9]+\z/, message: "Half-width number"}
    validates :category_id,        numericality: { other_than: 1, message: "Select" }
    validates :condition_id,       numericality: { other_than: 1, message: "Select" }
    validates :shipping_charge_id, numericality: { other_than: 1, message: "Select" }
    validates :shipping_from_id,   numericality: { other_than: 1, message: "Select" }
    validates :shipping_day_id,    numericality: { other_than: 1, message: "Select" }
  end
end
