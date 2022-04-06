class ItemsController < ApplicationController
  def index
    @items = Item.all
    render :index
  end

  def show
    # where can I find @items?
    @item = Item.find(params[:id])
    render :show
  end

  def new
    @item = Item.new
    render :new
  end

  def create
    item = Item.create(params.require(:item).permit(:name, :price))
    redirect_to items_path, :notice => "Item berhasil ditambahkan ✅"
  end

  def edit
    @item = Item.find(params[:id])
    render :edit
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(params.require(:item).permit(:name, :price))
      redirect_to items_path, :notice => "Item berhasil diperbarui ✅"
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, :notice => "Item berhasil dihapus ✅"
  end
end
