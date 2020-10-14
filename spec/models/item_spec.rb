require 'rails_helper'
describe Item do
  describe '#create' do

    it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include(I18n.t('errors.messages.blank'))
    end

    it "descriptionがない場合は登録できないこと" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include(I18n.t('errors.messages.blank'))
    end

    it "descriptionが1001文字以上では登録できないこと" do
      item = build(:item, description: "a" * 1001)
      item.valid?
      expect(item.errors[:description]).to include(I18n.t('errors.messages.too_long', count: 1000))
    end

    it "descriptionが1000文字であれば登録できること" do
      item = build(:item, description: "a" * 1000 )
      expect(item).to be_valid
    end

    it "conditionがない場合は登録できないこと" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include(I18n.t('errors.messages.blank'))
    end

    it "statusがない場合は登録できないこと" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include(I18n.t('errors.messages.blank'))
    end

    it "shipping_costsがない場合は登録できないこと" do
      item = build(:item, shipping_costs: nil)
      item.valid?
      expect(item.errors[:shipping_costs]).to include(I18n.t('errors.messages.blank'))
    end

    it "shipping_fromがない場合は登録できないこと" do
      item = build(:item, shipping_from: nil)
      item.valid?
      expect(item.errors[:shipping_from]).to include(I18n.t('errors.messages.blank'))
    end

    it "shipping_dateがない場合は登録できないこと" do
      item = build(:item, shipping_date: nil)
      item.valid?
      expect(item.errors[:shipping_date]).to include(I18n.t('errors.messages.blank'))
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include(I18n.t('errors.messages.blank'))
    end

    it "priceが300より小さい場合は登録できないこと" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include(I18n.t('errors.messages.greater_than_or_equal_to', count: 300))
    end

    it "priceが10000000以上である場合は登録できないこと" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include(I18n.t('errors.messages.less_than', count: 10000000))
    end

    it "category_idがない場合は登録できないこと" do
      item = build(:item)
      item[:category_id] = nil
      item.valid?
      expect(item.errors[:category]).to include(I18n.t('errors.messages.blank'))
    end

    let(:src) { File.join(Rails.root, 'spec/factories/test.jpg') }
    let(:image) { Rack::Test::UploadedFile.new(src) }
      it "name,description,brand,condition,status,shipping_costs,shipping_from,shipping_date,image,category_idが存在すれば登録できること" do
        item = build(:item)
        expect(item).to be_valid
      end

  end
end