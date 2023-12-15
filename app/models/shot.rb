class Shot < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :user_shot, UserShotUploader
  validates_presence_of :user_shot, :title
  is_impressionable
end
