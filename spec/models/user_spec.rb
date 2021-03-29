
require 'rails_helper'
describe User do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
      end

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a password_confirmation" do
      user = build(:user,  encrypted_confirmation: "")
      user.valid?
      expect(user.errors[:encrypted_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "is invalid without a first_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid with a first_name by Half-width alphanumeric characters" do
      user = build(:user, first_name: "kotaro")
      user.valid?
      expect(user.errors[:first_name]).to include("は、全角で入力して下さい")
    end

    it "is invalid without a family_name" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "is invalid with a family_name by Half-width alphanumeric characters" do
      user = build(:user, family_name: "hurima")
      user.valid?
      expect(user.errors[:family_name]).to include("は、全角で入力して下さい")
    end

    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "is invalid with a first_name_kana by Half-width alphanumeric characters and Kanji" do
      user = build(:user, first_name_kana: "小太郎")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は、全角カナで入力して下さい")
    end

    it "is invalid without a family_name_kana" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "is invalid with a family_name_kana by Half-width alphanumeric characters and Kanji" do
      user = build(:user, family_name_kana: "小太郎")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は、全角カナで入力して下さい")
    end

    

    it "is valid with more than 7 characters in password" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      expect(user).to be_valid
    end

    it "is invalid too short a password" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it 'is invalid too long a password' do
      user = build(:user, password: 'testtoolong128testtoolong128testtoolong128testtoolong128testtoolong128testtoolong128testtoolong128testtoolong128testtoolong128testtoolong128')
      user.valid?
      expect(user.errors[:password]).to include("は128文字以内で入力してください")
    end
  end
end