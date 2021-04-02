
require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
      @another_user = FactoryBot.create(:user)
    end

    context '保存できる場合' do
      it "全ての項目の入力が存在すれば登録できること" do 
        expect(@user).to be_valid
      end
     end
  
    context "空の値では登録できない時" do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors[:nickname]).to include("can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = '@'
      @user.valid?
      expect(@user.errors[:email]).to include("is invalid")
    end

    it 'last_nameが空では登録できない' do
    @user.last_name = ''
    @user.valid?
    expect(@user.errors[:last_name]).to include("は、全角で入力して下さい")
    end

  it 'first_nameが空では登録できない' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors[:first_name]).to include( "は、全角で入力して下さい")
    end

    it 'last_name_kanaが空では登録できない' do
    @user.last_name_kana = ''
    @user.valid?
    expect(@user.errors[:last_name_kana]).to include( "は全角カナで入力して下さい。")
   end

   it 'first_name_kanaが空では登録できない' do
    @user.first_name_kana = ''
    @user.valid?
    expect(@user.errors[:first_name_kana]).to include("は全角カナで入力して下さい。")
    end

   it 'birthdayが空では登録できない' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors[:birthday]).to include("can't be blank")
   end

   it 'passwordが空では登録できない' do
   @user.password = ''
   @user.valid?
   expect(@user.errors[:password]).to include("には英字と数字の両方を含めて設定してください")
  end
end



  context "重複した場合登録できない時" do
     it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    end
  

context "文字数があってない場合登録できない" do
it '5文字以下の場合登録できない' do
  @user.password = 'a0000'
  @user.valid?
  expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)", "is too short (minimum is 6 characters)")
end
end

context "数字の場合登録できない時" do
it 'passwordは数字のみでは登録できないこと' do
  @user.password = '111111'
  @user.valid?
  expect(@user.errors[:password]).to include("には英字と数字の両方を含めて設定してください")
end

context "英語の場合場合登録できない時" do
it 'passwordは英語のみでは登録できないこと' do
  @user.password = 'aaaaaa'
  @user.valid?
  expect(@user.errors[:password]).to include("には英字と数字の両方を含めて設定してください")
end
end

context "半角文字でないと登録できない" do
it 'paswwordは全角文字では登録できないこと' do
  @user.password = 'AAAAAA'
  @user.valid?
  expect(@user.errors[:password]).to include("には英字と数字の両方を含めて設定してください")
end
end

context "一致していないと登録できない時" do
it 'passwordとpassword_confirmationが一緒ではない場合に登録できない' do
  @user.password = ''
  @user.valid?
  expect(@user.errors[:password]).to include("には英字と数字の両方を含めて設定してください")
end
end

context "確認パスワードを入力しない場合登録できない時" do
it '確認パスワードを入力しないと登録できない'do
  @user.password_confirmation = ''
  @user.valid?
  expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
 end
end

context '半角カタカナの場合登録できない' do
  it 'last_name_kanaが半角カタカナでは登録できない' do
  @user.last_name_kana = 'ﾀﾛｳ'
  @user.valid?
  expect(@user.errors[:last_name_kana]).to include( "は全角カナで入力して下さい。")
end

  it 'first_name_kanaが半角カタカナでは登録できない' do
 @user.first_name_kana = 'ﾔﾏﾀﾞ'
 @user.valid?
 expect(@user.errors[:first_name_kana]).to include( "は全角カナで入力して下さい。")
end

context '全角文字以外では登録できない'
it 'first_nameは全角文字以外では登録できない' do
  @user.first_name = 'yamada'
  @user.valid?
  expect(@user.errors[:first_name]).to include( "は、全角で入力して下さい")
end

it 'last_nameは全角以外では登録できない' do
  @user.last_name = 'tarou'
  @user.valid?
  expect(@user.errors[:last_name]).to include( "は、全角で入力して下さい")
end
end
end
end
end


