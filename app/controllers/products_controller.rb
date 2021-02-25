class ProductsController < ApplicationController
  #before_action :move_to_index, except: :index
  before_action :set_shopping, only: [:edit, :update, :destroy, :show]


  def index
    @shoppings = Shopping.all
  end

  def new
    @shopping = Shopping.new
  end

  def create
    @shopping = Shopping.new(shopping_params)
    if @shopping.save
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
    @shopping.update(shopping_params)
    if @shopping.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @shopping.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  private

  def shopping_params
    params.require(:shopping).permit(:image, :product_name, :price)#.merge(owner_id: current_owner.id)
  end

  def set_shopping
    @shopping = Shopping.find(params[:id])
  end

  #  def move_to_index
  #    redirect_to action: :index unless user_signed_in? || owner_signed_in?
  #  end
end
