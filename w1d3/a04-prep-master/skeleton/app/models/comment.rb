class Comment < ActiveRecord::Base
  validates :body, :user_id, :link_id, :user, :link, presence: true

  belongs_to :user
  belongs_to :link
end
