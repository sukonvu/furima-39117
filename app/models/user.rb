class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_many :orders
         
         validates :nick_name, length: { maximum: 40 }
         validates :nick_name, :last_name, :last_name_kana, :first_name, :first_name_kana, :birthday, presence: true
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, format: { with: VALID_PASSWORD_REGEX }
         validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
         validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶ]+\z/}


end
