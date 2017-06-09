class Cookingpost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 1540 }
  validate  :picture_size

   private
    def picture_size
      if picture.size > 1.megabytes 
        errors.add(:picture, "please add pic < 1MB")
      end
    end
end

