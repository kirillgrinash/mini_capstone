class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]
  
  def index
    
    @products = Product.all

    if params[:search]
      @products = @products.where("name ILIKE ?", "%#{params[:search]}%")
    end

    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end

    if params[:discount] == "true"
      @products = @products.where("price < ?", 30)
    end

    if params[:sort] == "price" && params[:sort_order] == "asc"
      @products = @products.order(price: :asc)
    elsif params[:sort] == "price" && params[:sort_order] == "desc"
      @products = @products.order(price: :desc)
    else
      @products = @products.order(id: :asc)
    end

    render "index.json.jb"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name], 
      price: params[:price], 
      description: params[:description],
      supplier_id: params[:supplier_id],
    )
    if @product.save
      Image.create!(product_id: @product.id, url: params[:image_url])
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def update
    @product = Product.find_by(id: params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Product has been removed"}
  end
end
