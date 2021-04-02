class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
         
   

   with_options presence: true do
    validates :password, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i, message: "英数字文字6以上"}
    validates :nickname
    validates :birthday
   end

    with_options format: {  with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は、全角で入力して下さい"} do
    validates :last_name
    validates :first_name
   end
    with_options format: {  with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'は全角カナで入力して下さい。'} do
    validates :last_name_kana
    validates :first_name_kana
    end
  end
