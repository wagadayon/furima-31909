class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
   
   

   with_options presence: true do
    validates :password, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i, message: "英数字文字6以上"}
    validates :nickname
    validates :first_name, 
    format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "は、全角で入力して下さい"}
    validates :last_name, 
    format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "は、全角で入力して下さい"}
    validates :first_name_kana, 
    format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'は全角カナで入力して下さい。'}
    validates :last_name_kana,
    format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'は全角カナで入力して下さい。'}
      
    validates :birthday
      

   end
   
end
