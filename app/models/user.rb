class User < ActiveRecord::Base
  has_many :posts, -> { order 'created_at desc' }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
