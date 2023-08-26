require 'rails_helper'

RSpec.describe Order, type: :model do
  
    describe '商品購入情報の保存' do
      before do
        user = FactoryBot.create(:user)
        item = FactoryBot.create(:item, user:user)
        @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      end
      context '商品購入情報を保存できるとき' do
        it '全ての購入情報が正しく入力されていれば商品購入情報を保存できる' do
          expect(@order_address).to be_valid
        end
        it '建物名が空でも商品購入情報を保存できる' do
          @order_address.building_name = nil
          expect(@order_address).to be_valid
      end
    end
  
      context '商品購入情報を保存できないとき' do
        before do
        @order_address = FactoryBot.build(:order_address, user_id: nil, item_id: nil)
        end

        it 'カード情報が空だと保存できない' do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
        it '郵便番号が空だと保存できない'do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
        end
        it '郵便番号がハイフンを含んだ正しい形でないと保存できない' do
        @order_address.postal_code = '1231234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
        end
        it '都道府県が空だと保存できない' do
        @order_address.prefecture_id = Prefecture.find_by(id: 1)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '市区町村が空だと保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
        end
        it '番地が空だと保存できない' do
        @order_address.address_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address num can't be blank")
        end
        it '電話番号が空だと保存できない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
        end
        it '電話番号が半角数字以外のものは保存できない' do
        @order_address.phone = '１２３４５６７８９８９'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid. Input only number")
        end
        it '電話番号が9桁以下では保存できない' do
          @order_address.phone_number = '123456789'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Tel is too short (minimum is 10 characters)')
        end
        it '電話番号が12桁以上では購入できない' do
          @order_address.phone_number = '123456789123456789'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Tel is too long (maximum is 11 characters)')
        end
        it 'itemが紐付いていない場合は保存できない' do
          @order_address.item_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end
          it 'ユーザーが存在しない場合は保存できない' do
            @order_address.user_id = nil
            @order_address.valid?
            expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
      end
    end
  end