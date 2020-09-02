class Api::ProductsController < ApplicationController
  def product
    @products = Product.all
    render "product.json.jb"
  end

  def health_potion
    @health_potion = Product.find_by(name: "Health Potion")
    render "health_potion.json.jb"
  end

  def mana_potion
    @mana_potion = Product.find_by(name: "Mana Potion")
    render "mana_potion.json.jb"
  end
end
