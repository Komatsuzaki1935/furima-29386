class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_from
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :category_id,        numericality: { other_than: 1 }
    validates :condition_id,       numericality: { other_than: 1 }
    validates :shipping_charge_id, numericality: { other_than: 1 }
    validates :shipping_from_id,   numericality: { other_than: 1 }
    validates :shipping_day_id,    numericality: { other_than: 1 }
    validates :price,              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
end
