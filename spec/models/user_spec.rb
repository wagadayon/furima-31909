
require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nameとemail、password,last_nameとfirst_name/kanaが存在すれば登録できること' do
      expect(@user).to be_valid
    end


    context "登録できない時" do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors[:nickname]).to include("can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    
    end

    it 'last_nameが空では登録できない' do
    @user.last_name = ''
    @user.valid?
    expect(@user.errors[:last_name]).to include("can't be blank")
    
  end

  it 'first_nameが空では登録できない' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors[:first_name]).to include( "can't be blank")
    
   end

    it 'last_name_kanaが空では登録できない' do
    @user.last_name_kana = ''
    @user.valid?
    expect(@user.errors[:last_name_kana]).to include( "can't be blank")
  end

   it 'first_name_kanaが空では登録できない' do
    @user.first_name_kana = ''
    @user.valid?
    expect(@user.errors[:first_name_kana]).to include("can't be blank")
   end

   it 'birthdayが空では登録できない' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors[:birthday]).to include("can't be blank")
   end

   it 'passwordが空では登録できない' do
   @user.password = ''
   @user.valid?
   expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)", "英数字文字6以上")
  end

  it '@が含まれていない場合登録できない' do
    @user.email = ''
    @user.valid?
    expect(@user.errors[:email]).to include("can't be blank")
  end

  it 'メールアドレスが重複した場合登録できない' do
    @user.email = ''
    @user.valid?
    expect(@user.errors[:email]).to include("can't be blank")
  end

it '5文字以下の場合登録できない' do
  @user.password = ''
  @user.valid?
  expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)", "英数字文字6以上")
end

it '数字のみでは登録できないこと' do
  @user.password = ''
  @user.valid?
  expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)", "英数字文字6以上")
end

it '英語のみでは登録できないこと' do
  @user.password = ''
  @user.valid?
  expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)", "英数字文字6以上")
end

it '全角文字では登録できないこと' do
  @user.password = ''
  @user.valid?
  expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)", "英数字文字6以上")
end

it 'パスワードとパスワード（確認用）、値の一致していない場合登録できないこと' do
  @user.password = ''
  @user.valid?
  expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)", "英数字文字6以上")
end

it '確認パスワードを入力しないと登録できない' do
  @user.password_confirmation = ''
  @user.valid?
  expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
end
 end
end
end


