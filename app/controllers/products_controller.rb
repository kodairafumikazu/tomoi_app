class ProductsController < ApplicationController
  #before_action :move_to_index, except: :index
  before_action :set_product, only: [:edit, :update, :destroy, :show]


  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  private

  def product_params
    params.require(:product).permit(:image, :product_name, :price, :info)#.merge(owner_id: current_owner.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  #  def move_to_index
  #    redirect_to action: :index unless user_signed_in? || owner_signed_in?
  #  end
end
