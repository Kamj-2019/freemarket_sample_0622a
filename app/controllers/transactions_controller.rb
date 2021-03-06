class TransactionsController < ApplicationController 
  before_action :set_item
  before_action :set_card
  require 'payjp'

  def show
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "cards", action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      get_payjp
      if @item.aasm_state == 'waiting'
        @item.run!
      end
    end
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: @card.customer_id, #顧客ID
    currency: 'jpy', #日本円
    )
    redirect_to action: 'done' #完了画面に移動
  end

  def  done
    @item.finish!
    get_payjp
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
  
  #Cardテーブルからpayjpの顧客IDを検索
  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def get_payjp
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    #保管した顧客IDでpayjpから情報取得
    customer = Payjp::Customer.retrieve(@card.customer_id)
    #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
    @default_card_information = customer.cards.retrieve(@card.card_id)
    @card_brand = @default_card_information.brand      
    case @card_brand
    when "Visa"
      @card_src = "visa.svg"
    when "JCB"
      @card_src = "jcb.svg"
    when "MasterCard"
      @card_src = "master-card.svg"
    when "American Express"
      @card_src = "american_express.svg"
    when "Saison Card"
      @card_src = "saison-card.svg"
    when "Diners Club"
      @card_src = "dinersclub.svg"
    when "Discover"
      @card_src = "discover.svg"
    end
  end

end
