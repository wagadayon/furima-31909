class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
   validates :nickname, presence: true
   validates :email, presence: true
   validates :encrypted_password, presence: true, length: {minimum:6}

   with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: '全角文字を使用してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: '全角文字を使用してください' }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナを使用してください" }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナを使用してください" }
    validates :birth_day
    validates :password, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i, message: "英数字文字6以上"}

   end
   


end
