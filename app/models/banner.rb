class Banner < ApplicationRecord
  validates :banner_image, :slideshow_banner_title,:banner_link, presence: true
  has_attached_file :banner_image, default_url: "/assets/storage/banner/missing.png", :url => "/assets/storage/banner/:basename.:extension"
  validates_attachment_content_type :banner_image, content_type: /\Aimage\/.*\z/
end
