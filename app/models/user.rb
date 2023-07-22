class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :nick_name, length: { maximum: 40 }
         validates :nick_name, :last_name, :last_name_kana, :first_name, :first_name_kana, :birthday, presence: true
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, format: { with: VALID_PASSWORD_REGEX }
         validates :password_confirmation, presence: true
         validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
         validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ン]+\z/}


end
