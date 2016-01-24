class Post < ActiveRecord::Base
  belongs_to :user, counter_cache: true

  validates :body,
    presence: true,
    length: { maximum: 150 }

  default_scope { order 'created_at desc' }
end
