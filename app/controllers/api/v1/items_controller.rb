class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]
  before_action :set_user

  def index
    # if valid_params?(User, params[:user_id], "user")
      render json: ItemSerializer.new(@user.items)
    # end
  end

  def show
    # if valid_params?(User, params[:user_id], "user") && valid_params?(Item, params[:item_id], "item")
      render json: ItemSerializer.new(@item)
    # end
  end

  def create
    # if valid_params?(User, params[:user_id], "user")
      item = Item.new(item_params)
      if item.save
        render json: ItemSerializer.new(item), status: :created
      else
        database_error(item)
      end
    # end
  end

  def update
    # if valid_params?(User, params[:user_id], "user") && valid_params?(Item, params[:item_id], "item")
      @item.update(item_params)
      if @item.save
        render json: ItemSerializer.new(@item), status: 201
      else
        database_error(@item)
      end
    # end
  end

  def destroy
    # if valid_params?(User, params[:user_id], "user") && valid_params?(Item, params[:item_id], "item")
      @item.destroy
      render status: 204
    # end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :count, :category, :user_id)
  end

  def set_item
    if valid_params?(Item, params[:item_id], "item")
      @item = @object
    end
  end

  def set_user
    if valid_params?(User, params[:user_id], "user")
      @user = @object
    end
  end
end
