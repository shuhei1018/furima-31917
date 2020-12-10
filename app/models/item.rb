class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_burden
  belongs_to :delivery_area
  belongs_to :delivery_date

  validates :name, :explanation, :price, presence: true

  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :delivery_burden_id, numericality: { other_than: 1 } 
  validates :delivery_area_id, numericality: { other_than: 1 } 
  validates :delivery_date_id, numericality: { other_than: 1 } 
end
