class ItemsController < ApplicationController

  def index # トップページ一覧表示
    @items = Item.all
  end

  def category # カテゴリー一覧表示
    @items = Item.all.where(category_id: params[:id])
  end

  def brand # ブランド一覧表示
    @items = Item.all.where(brand_id: params[:id])
  end

  def new # 商品出品
    @item = Item.new
  end

  def create # 商品出品完了
  end

  def show # 商品詳細表示
    @item = Item.find(params[:id])
  end

  def edit # 商品情報編集
  end

  def update # 商品情報編集完了
  end

  def destroy
  end

  private

  def item_params
    params.permit(:id)
  end
end