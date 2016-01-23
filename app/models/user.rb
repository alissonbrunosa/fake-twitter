class User < ActiveRecord::Base
  has_many :posts
  has_and_belongs_to_many(:followers,
    class_name: "User",
    join_table: "user_connections",
    foreign_key: "to_user_id",
    association_foreign_key: "from_user_id")

  has_and_belongs_to_many(:following,
    class_name: "User",
    join_table: "user_connections",
    foreign_key: "from_user_id",
    association_foreign_key: "to_user_id", includes: :posts)

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def feed
    ids = following_ids
    ids << self.id
    Post.includes(:user).where(user_id: ids)
  end
end
