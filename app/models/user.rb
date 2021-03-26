class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
   validates :nickname, presence: true
   validates :email, presence: true
   validates :password, presence: true, length: {minimum:7}

   VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
   validates :family_name, :first_name, presence: true, format: { with: VALID_NAME_REGEX, message: "は全角で入力してください" }

   VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  validates :family_name_kana, :first_name_kana, presence: true, format: { with: VALID_KANA_NAME_REGEX, message: "は全角カナで入力してください" }





end
