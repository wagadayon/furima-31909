class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create,:edit,:update,:destroy ]
  before_action :set_item, only: [:show, :edit, :update,:destroy]
  before_action :move_to_index, only: [:edit, :update,:destroy]
  

def index
  @items = Item.includes(:user).order('created_at DESC')
end

def new
  @item = Item.new
end

def create
  @item = Item.new(item_params)
  # @item = Item.new(item_params)
  if @item.save
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
      if  @item.update(item_params)
        redirect_to  item_path
      else
        render :edit
      end
    end
      def destroy
        if @item.destroy
          redirect_to root_path
        else
          redirect_to item_path(@item.id)
        end
      end


          

    private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :explanation, :condition_id, :postage_id, :area_id, :price, :delivery_id,  :category_id, :image).merge(user_id: current_user.id)
    end

    def move_to_index
      redirect_to root_path unless current_user.id == @item.user_id 
    end

    
end
