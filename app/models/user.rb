class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  validates :nickname, presence: true
  validates :password, length: { minimum: 7 },
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "に半角英数字以外の文字が含まれてます。" }       
  validates :email, uniqueness:true, length:{ maximum: 255 }, 
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "が正しい形式ではありません。" }   
  validates :first_name, :last_name, presence: true,
            format: { with: /\A[A-Z\p{Hiragana}\p{Han}]+\z/, message: "は英大文字か漢字、ひらがなのみです。" }
  validates :first_name_kana, :last_name_kana, presence: true,
            format: { with: /\A[A-Z\p{Katakana}]+\z/, message: "は英大文字かカタカナのみです。"}     
  validates :birthday, presence: true
  has_one :address
  has_many :items
end
