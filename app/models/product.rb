class Product < ApplicationRecord
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