require 'rails_helper'

describe User do
  describe '#create' do
    it "nickname、email、password、password_confirmation、first_name,last_name、first_name_kana、last_name_kana、birthdayがないと登録できないこと" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがないと登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailがないと登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")  
    end

    it "passwordがないと登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが存在してもpassword_confirmationがない場合登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "first_nameがないと登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "last_nameがないと登録できないこと" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "first_name_kanaがないと登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "last_name_kanaがないと登録できないこと" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "passwordが７文字以上かつ半角英数字を両方含む場合であれば登録できること" do
      user = build(:user, password: "2084tku", password_confirmation: "2084tku")
      expect(user).to be_valid 
    end

    it "passwordが６文字以下の場合登録できないこと" do
      user = build(:user, password: "2000ta")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    it "passwordが半角英数字以外を含む場合登録できないこと" do
      user = build(:user, password: "2000か")
      user.valid?
      expect(user.errors[:password]).to include("is must NOT contain any other characters than alphanumerics.")
    end
    
  end
end