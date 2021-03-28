require 'rails_helper'
RSpec.describe User, type: :model do

before do 
  @user = FactoryBot.build{:user}
end

describe "ユーザー新規登録" do
  it "ニックネームが空では登録できない" do
    @user.nickname = ""
      @user.valid? 
      expect(@user.errors.full_messages).to include("Nickname can't be blank") 
  end

  it "emailが空では登録できない" do
    @user.email = ""  
    @user.valid? 
    expect(@user.errors.full_messages).to include("Email can't be blank") 
   
  end

  it "passwordが空では登録できない" do
    @user.password = ""
    @user.valid? 
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

    it "性が空だと登録できない" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "名が空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "性カナが空だと登録できない" do
      @user.family_name_kana = ""
      user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "名カナが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードと確認パスワードが一致していないと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードが7文字以上で登録できる" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

   

    it "パスワードが7文字未満だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
 

    it '性を半角で入力した時登録できない' do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
 
    it '名を半角で入力した時登録できない' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end


    it '性カナをカタカナ意外で入力した時登録できない' do
      @user .family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
 
    it '名カナをカタカナ意外で入力した時登録できない' do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
  end
end

