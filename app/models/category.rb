class Category < ApplicationRecord
  has_many :categories_products
  has_many :products, through: :categories_products
  validates :category_name, presence: true
  has_attached_file :category_image, styles: {cover:"850x360>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :category_image, content_type: /\Aimage\/.*\z/
  extend ActsAsTree::TreeView
  acts_as_tree order: "category_name"

  def self.to_csv
    attributes = %w{id category_name description category_image_file_name category_image_content_type parent_id}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |category|
        csv << category.attributes.values_at(*attributes)
      end
    end
  end
end
