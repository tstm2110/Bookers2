class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  attachment :image # ここを追加（_idは含めません）
   has_many :books, dependent: :destroy

   validates :name, length: {maximum: 20}
    validates :name, length: {minimum: 2}
   validates :name, presence: true,uniqueness:true

   attachment :profile_image
   validates :introduction, length: {maximum: 50}
end
