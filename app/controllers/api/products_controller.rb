class Api::ProductsController < ApplicationController
  def products_active
    @products = Product.all
    render "products.json.jb"
  end

  def product
    variable = params["product_id"]
    @product = Product.find_by(id: variable)
    render "product.json.jb"
  end

end
