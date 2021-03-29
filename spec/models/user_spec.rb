
require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nameとemail、password,last_nameとfirst_name/kanaが存在すれば登録できること' do
      expect(@user).to be_valid
    end

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
    expect(@user.errors[:last_name]).to include("全角文字を使用してください")
    
  end

  it 'first_nameが空では登録できない' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors[:first_name]).to include("全角文字を使用してください")
    
   end

    it 'last_name_kanaが空では登録できない' do
    @user.last_name_kana = ''
    @user.valid?
    expect(@user.errors[:last_name_kana]).to include("全角カタカナを使用してください")
  end

   it 'first_name_kanaが空では登録できない' do
    @user.first_name_kana = ''
    @user.valid?
    expect(@user.errors[:first_name_kana]).to include("全角カタカナを使用してください")
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
end

