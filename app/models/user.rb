class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  attachment :image # ここを追加（_idは含めません）
   has_many :books, dependent: :destroy

   validates :name, lengh: {maximum: 20}
   validates :name, presence: true
   attachment :profile_image
   validates :introduction, lengh: {maximum: 50}
end
