require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do

    context '商品登録がうまくいくとき' do
      it "商品画像、商品名、商品説明、カテゴリー、商品状態、配送料、配送元、配送日、料金 が存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "カテゴリーを選択すれば登録できる" do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it "商品状態を選択すれば登録できる" do
        @item.condition_id = 3
        expect(@item).to be_valid
      end
      it "配送料を選択すれば登録できる" do
        @item.shipping_charge_id = 2
        expect(@item).to be_valid
      end
      it "配送元を選択すれば登録できる" do
        @item.shipping_from_id = 30
        expect(@item).to be_valid
      end
      it "配送日を選択すれば登録できる" do
        @item.shipping_charge_id = 4
        expect(@item).to be_valid
      end
      it "料金 が半角数字かつ300から9999999の間であること" do
        @item.price = 5000
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it "商品画像が空では登録できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空では登録できないこと" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明が空では登録できないこと" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーを選択しないと登録できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "商品状態を選択しないと登録できないこと" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end
      it "配送料を選択しないと登録できないこと" do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge Select")
      end
      it "配送元を選択しないと登録できないこと" do
        @item.shipping_from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping from Select")
      end
      it "配送日を選択しないと登録できないこと" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day Select")
      end
      it "料金が空では登録できないこと" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "料金が半角数字以外では登録できないこと" do
        @item.price = "千"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "料金 が300未満だと登録できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "料金 が9999999以上だと登録できないこと" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end
