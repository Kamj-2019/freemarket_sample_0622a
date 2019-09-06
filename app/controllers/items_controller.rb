class ItemsController < ApplicationController

  def index # トップページ一覧表示
    # カテゴリー
    @items = Item.all
    @category1 = FirstCategory.find(1)
    @category2 = FirstCategory.find(2)
    @category3 = FirstCategory.find(3)
    @category4 = FirstCategory.find(7)
    
    # アイテムの制限
    @items1 = @items.where(category_id:1..122)
    @items2 = @items.where(category_id:123..228)
    @items3 = @items.where(category_id:229..341)
    @items4 = @items.where(category_id:604..689)

    #ブランド
    @brand1 = Brand.find(49)
    @brand2 = Brand.find(50)
    @brand3 = Brand.find(52)
    @brand4 = Brand.find(51)
  end

  def category # カテゴリー一覧表示
    @items = Item.all
  end

  def brand # ブランド一覧表示
    @items = Item.all.where(brand_id: params[:id])
  end

  def new # 商品出品
    @item = Item.new
    @item.item_images.build
  end

  def create # 商品出品完了
    @item = Item.new(item_params)
    @item.user_id = current_user.id    
    if @item.save
      redirect_to root_path
    end
  end

  def show # 商品詳細表示
    @item = Item.find(params[:id])
    @allitems = Item.all.order('id DESC')
    @images = ItemImage.all
  end

  def edit # 商品情報編集
  end

  def update # 商品情報編集完了
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :item_title, :description, :status_id, :price, :brand_id, :delivery_fee_payer_id, :prefecture_id, :shipping_day_id, :size_id, :delivery_method_id, :category, item_images_attributes: [:image_url, :item_id])
  end

end
