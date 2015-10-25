class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]

  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
  end

  def show
  end

  def new
  end

  def edit
    if product.user_id != current_user.id
      flash[:error] = 'You are not allowed to edit this product.'
      redirect_to category_product_url(category, product)
    elsif Processingitem.exists?(item_type: 'product', item_id: product.id)
      redirect_to category_products_path(category, product), notice: 'This product is pending edit in other session.'
    else
      Processingitem.create(item_type: 'product', item_id: product.id)
    end
  end

  def back  
    Processingitem.destroy_all(item_type: "product", item_id: product.id)
    redirect_to category_products_path(category, product)
  end

  def create
    self.product = Product.new(product_params)
    product.user_id = current_user.id

    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if product.user_id != current_user.id
      flash[:error] = 'You are not allowed to edit this product.'
      redirect_to category_product_url(category, product)
    elsif self.product.update(product_params)
      Processingitem.destroy_all(item_type: "product", item_id: product.id)
      redirect_to category_product_path(category, product), notice: 'Product was successfully updated.'
    else
      #render action: 'edit'
      redirect_to category_product_url(category, product)
    end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end
end
