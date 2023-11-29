class Shot < ApplicationRecord
  belongs_to :user
  mount_uploader :user_shot, UserShotUploader
  validates_presence_of :user_shot, :title
end
