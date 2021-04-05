class Item < ApplicationRecord
  



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :postage
  belongs_to :area
  belongs_to :day

 with_options presence: true do
  validates :name
  validates :area_id
  validates :day_id
  validates :postage_id
  validates :explanation
  validates :condition_id
  validates :category_id
  validates :price
  validates :user
  
end

with_options numericality: {other_than: 1 } do
 validates :price
 validates :day_id
 validates :area_id
 validates :postage_id
 validates :condition_id

end

with_options  numericality: {greater_than_or_equal_to: 300}
validates :price
end

with_options numericality: {less_than_or_equal_to: 9999999}
validates :price
end

 with_options format: {with: /\A[0-9]+\z/} do
  validates :price
 end
end
    
  