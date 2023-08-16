require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do
    context '商品情報を保存できるとき' do
      it '全ての情報が正しく入力されていれば商品情報を保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品情報を保存できないとき' do
      it 'ユーザーが存在しない場合は保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it '価格が300未満の場合は出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が9,999,999円を超える場合は出品できない'do
      @item.price = 10000000 
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

      it '商品画像がない場合は保存できない' do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item image can't be blank")
      end

      it '商品名がない場合は保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = "asd" 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

     
    end

    it '商品画像のバリデーション' do
      @item.item_image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item image can't be blank")
    end

    it 'アイテム名のバリデーション' do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it '商品の説明のバリデーション' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーが選択されていない場合は保存できない' do
      @item.category = Category.find_by(id: 1)
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '配送料の負担が選択されていない場合は保存できない' do
      @item.delivery_charge = DeliveryCharge.find_by(id: 1)
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end

    it '発送元の地域が選択されていない場合は保存できない' do
      @item.prefecture = Prefecture.find_by(id: 1)
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '発送までの日数が選択されていない場合は保存できない' do
      @item.shipping_date = ShippingDate.find_by(id: 1)
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date can't be blank")
    end
  end
end


 