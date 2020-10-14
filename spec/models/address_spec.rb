require 'rails_helper'

describe Address do
  describe '#create' do
    it "postal_code,prefecturs,municipalities,block_number,building_name,phone_unmberがないと登録できないこと" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "postal_codeがないと登録できないこと" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("can't be blank")
    end

    it "prefectursがないと登録できないこと" do
      address = build(:address, prefecturs: nil)
      address.valid?
      expect(address.errors[:prefecturs]).to include("can't be blank")
    end

    it "municpalitiesがないと登録できないこと" do
      address = build(:address, municipalities: nil)
      address.valid?
      expect(address.errors[:municipalities]).to include("can't be blank")
    end

    it "prefectursがないと登録できないこと" do
      address = build(:address, block_number: nil)
      address.valid?
      expect(address.errors[:block_number]).to include("can't be blank")
    end

    it "prefectursがないと登録できないこと" do
      address = build(:address, building_name: nil)
      address.valid?
      expect(address.errors[:building_name]).to include("can't be blank")
    end

    it "prefectursがないと登録できないこと" do
      address = build(:address, phone_number: nil)
      address.valid?
      expect(address.errors[:phone_number]).to include("can't be blank")
    end
  end
end