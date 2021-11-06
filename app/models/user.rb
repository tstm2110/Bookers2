class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  attachment :image # ここを追加（_idは含めません）
   has_many :books, dependent: :destroy
   has_many :book_comment, dependent: :destroy
   has_many :favorites, dependent: :destroy

    # foreign_key（FK）には、@user.xxxとした際に「@user.idがfollower_idなのかfollowed_idなのか」を指定します。

  has_many :follower, class_name:"Relationship", foreign_key:"follower_id", dependent: :destroy
   has_many :followed, class_name:"Relationship", foreign_key:"followed_id", dependent: :destroy
  # @user.booksのように、@user.yyyで、
  # そのユーザがフォローしている人orフォローされている人の一覧を出したい
 has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower
  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end
   # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

   validates :name, length: {maximum: 20}
    validates :name, length: {minimum: 2}
   validates :name, presence: true,uniqueness:true

   attachment :profile_image
   validates :introduction, length: {maximum: 50}
end
