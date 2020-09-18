class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 } 
  validates :description, length: { in: 2..500 } 

  belongs_to :supplier
  has_many :orders
  has_many :images
  has_many :category_products

  has_many :categories, through: :category_products

  def friendly_update_at
    updated_at.strftime("%B%e, %Y")
  end

  def is_discounted?
    price <= 30
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end