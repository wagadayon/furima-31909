
require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
      @another_user = FactoryBot.create(:user)
    end

  


    context "空の値では登録できない時" do
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
end
  
  context "重複した場合登録できない時" do
  it '重複したemailが存在する場合登録できない' do
    @user.created_at
      @another_user = FactoryBot.build(:user)
      @another_user.email 
      @another_user.valid?
      expect(@another_user.errors[:email]).to include("has already been taken")
  end
end

context "文字数があってない場合登録できない" do
it '5文字以下の場合登録できない' do
  @user.password = ''
  @user.valid?
  expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)", "英数字文字6以上")
end
end

context "数字の場合登録できない時" do
it 'passwordは数字のみでは登録できないこと' do
  @user.password = ''
  @user.valid?
  expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)", "英数字文字6以上")
end
end

context "英語の場合場合登録できない時" do
it 'passwordは英語のみでは登録できないこと' do
  @user.password = ''
  @user.valid?
  expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)", "英数字文字6以上")
end
end

context "半角文字でないと登録できない" do
it 'paswwordは全角文字では登録できないこと' do
  @user.password = ''
  @user.valid?
  expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)", "英数字文字6以上")
end
end

context "一致していないと登録できない時" do
it 'passwordとpassword_confirmationの内容が違う場合に登録できない' do
  @user.password = ''
  @user.valid?
  expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)", "英数字文字6以上")
end
end

context "確認パスワードを入力しない場合登録できない時" do
it '確認パスワードを入力しないと登録できない'do
  @user.password_confirmation = ''
  @user.valid?
  expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
 end
end
end
end


