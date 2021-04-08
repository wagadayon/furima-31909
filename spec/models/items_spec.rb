require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品が出来る時' do
      it '全ての項目が入力されていれば出品できる' do 
        expect(@item).to be_valid
      end
      
      it '価格が半角数値だけであれば出品できる' do
        @item.price = 123_456
        expect(@item).to be_valid
      end
    end

    context '出品が出来ない場合' do
      it '商品画像がない場合出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がない場合出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明がない場合出品できない' do
        @item.explanation  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーidが1の時出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態idが1の時出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it '配送料idが1の時出品できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end

      it '発送元の地域idが1の時出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end

      it '発送までの日数idが1の時出品できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery must be other than 1')
      end

      it '価格が全角平仮名での入力の時出品できない' do
        @item.price = 'あいう'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格が全角カタカナでの入力の時出品できない' do
        @item.price = 'アイウ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格が全角漢字での入力の時出品できない' do
        @item.price = '阿胃雨'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格入力がない時出品出来ない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格が半角英数混合での入力の時登録できない' do
        @item.price = 'ab4567'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格が半角英語だけでの入力の時出品出来ない' do
        @item.price = 'ab4567'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格が¥300〜¥9,999,999の範囲でない場合品できない' do
        @item.price = 150
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が¥300〜¥9,999,999の範囲でない場合出品できない' do
        @item.price = 1_000_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      
      it 'ユーザーが紐付いていない場合出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
