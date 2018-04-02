class Product < ApplicationRecord
  has_many :categories_products, dependent: :destroy
  has_many :categories, through: :categories_products
  accepts_nested_attributes_for :categories_products, allow_destroy: true;
  validates :product_name, :sku, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :cost, numericality: { greater_than: 0 }, allow_nil: true
  validates :stock_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 },
            allow_nil: true
  has_attached_file :product_image, default_url: "/assets/storage/missing.png", :url => "/assets/storage/:basename.:extension"
  validates_attachment_content_type :product_image, content_type: /\Aimage\/.*\z/

  def self.to_csv
    attributes = %w{product_name stock_quantity price cost sku taxable_class is_available product_description product_image_file_name product_image_content_type}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |product|
        csv << product.attributes.values_at(*attributes)
      end
    end
  end
end
