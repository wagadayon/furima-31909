
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
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("email can't be blank")
    end

    it 'last_nameが空ではとうろくできない' do
    @user.last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("last_name can't be blank")
  end

  it 'first_nameが空では登録できない' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("first_name can't be blank")
   end

    it 'last_name_kanaが空では登録できない' do
    @user.last_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("last_name_kana can't be blank")
  end

   it 'first_name_kanaが空では登録できない' do
    @user.first_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("first_name_kana can't be blank")
   end

   it 'birthdayが空では登録できない' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("birthday can't be blank")
   end

   it 'passwordが空では登録できない' do
   @user.password = ''
   @user.valid?
   expect(@user.errors.full_messages).to include("password can't be blank")
  end
 end
end

