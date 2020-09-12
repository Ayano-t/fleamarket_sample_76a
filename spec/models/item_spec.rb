require 'rails_helper'
describe Item do
  describe '#create' do

    it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "descriptionがない場合は登録できないこと" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "descriptionが1001文字以上では登録できないこと" do
      item = build(:item, description: "a" * 1001)
      item.valid?
      expect(item.errors[:description]).to include("is too long (maximum is 1000 characters)")
    end

    it "descriptionが1000文字であれば登録できること" do
      item = build(:item, description: "a" * 1000 )
      expect(item).to be_valid
    end

    it "conditionがない場合は登録できないこと" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

    it "statusがない場合は登録できないこと" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end

    it "shipping_costsがない場合は登録できないこと" do
      item = build(:item, shipping_costs: nil)
      item.valid?
      expect(item.errors[:shipping_costs]).to include("can't be blank")
    end

    it "shipping_fromがない場合は登録できないこと" do
      item = build(:item, shipping_from: nil)
      item.valid?
      expect(item.errors[:shipping_from]).to include("can't be blank")
    end

    it "shipping_dateがない場合は登録できないこと" do
      item = build(:item, shipping_date: nil)
      item.valid?
      expect(item.errors[:shipping_date]).to include("can't be blank")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "priceが300より小さいと登録できないこと" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "priceが9999999より大きいと登録できないこと" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it "category_idがない場合は登録できないこと" do
      item = build(:item)
      item[:category_id] = nil
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    let(:src) { File.join(Rails.root, 'spec/factories/test.jpg') }
    let(:image) { Rack::Test::UploadedFile.new(src) }
      it "name,description,brand,condition,status,shipping_costs,shipping_from,shipping_date,aが存在すれば登録できること" do
        item = build(:item)
        expect(item).to be_valid
      end

  end
end