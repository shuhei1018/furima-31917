class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_burden
  belongs_to :delivery_area
  belongs_to :delivery_date

  has_one_attached :image

  validates :name, :explanation, :image, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_burden_id, numericality: { other_than: 1 }
  validates :delivery_area_id, numericality: { other_than: 1 }
  validates :delivery_date_id, numericality: { other_than: 1 }

  VALID_PRICE_HALF = /\A[0-9]+\z/.freeze
  validates :price, format: { with: VALID_PRICE_HALF }, length: { minimum: 3, maximum: 7 }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
