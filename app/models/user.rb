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

  validates :name,
    presence: true


  devise :database_authenticatable, 
        :registerable, :recoverable, 
        :rememberable, :trackable, 
        :validatable, :omniauthable


  def feed
    ids = following_ids
    ids << self.id
    Post.includes(:user).where(user_id: ids)
  end

  def self.autocomple_name(value)
    order('name ASC').where('name LIKE ?', "%#{value}%")
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name 
      user.image = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
