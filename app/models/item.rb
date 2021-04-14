class Item < ApplicationRecord
  
  belongs_to :user
  has_one :purchase
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :postage
  belongs_to :area
  belongs_to :delivery
  belongs_to :condition

 with_options presence: true do
  validates :name
  validates :area_id
  validates :delivery_id
  validates :postage_id
  validates :explanation
  validates :condition_id
  validates :category_id
  validates :price
  validates :image
 
  
end

with_options numericality: {other_than: 1 } do
 validates :delivery_id
 validates :area_id
 validates :postage_id
 validates :condition_id
 validates :category_id

end

with_options numericality: { greater_than_or_equal_to: 300 } do
  validates :price
end


with_options numericality: {less_than_or_equal_to: 9999999} do
validates :price
end

 with_options format: {with: /\A[0-9]+\z/} do
  validates :price
 end
end

    
  