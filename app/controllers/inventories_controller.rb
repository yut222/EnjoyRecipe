class InventoriesController < ApplicationController

  before_action :set_inventory, only: [:show, :edit, :update, :destroy]

  def new
    @inventory = Inventory.new(flash[:inventory])
  end

  def create
    inventory = current_user.inventories.new(inventory_params)
    if inventory.save
      redirect_to inventories_user_path(current_user.id), flash: { notice: "「#{inventory.name}」を登録しました。" }
    else
      redirect_to new_inventory_path, flash: {
        inventory: inventory,
        error_messages: inventory.errors.full_messages
      }
    end
  end

  def edit
  end

  def show
  end

  def update
    @inventory.update(inventory_params)
    if @inventory.save
      redirect_to inventories_user_path(current_user.id), flash: { notice: "「#{@inventory.name}」の内容を更新しました。" }
    else
      flash[:inventory] = @inventory
      flash[:error_messages] = @inventory.errors.full_messages
      redirect_back fallback_location: @inventory
    end
  end

  def destroy
    @inventory.destroy
    redirect_to inventories_user_path(current_user.id), flash: { notice: "保存されていた「#{@inventory.name}」を削除しました。" }
  end

    private

  def set_inventory
    @inventory = Inventory.find(params[:id])
    if user_signed_in? && @inventory.user == current_user
      @inventory
    else
      redirect_back fallback_location: root_path
      flash[:alert] = "他人の食材管理ページ閲覧及び編集はできません。"
    end
  end

  def inventory_params
    params.require(:inventory).permit(:name, :quantity, :expiration_date, :memo, :user_id, :image)
  end

end
