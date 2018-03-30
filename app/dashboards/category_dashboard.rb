require "administrate/base_dashboard"

class CategoryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    categories_products: Field::HasMany,
    products: Field::HasMany,
    parent: Field::BelongsTo.with_options(class_name: "Category"),
    children: Field::HasMany.with_options(class_name: "Category"),
    id: Field::Number,
    category_name: Field::String,
    category_description: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    category_image_file_name: Field::String,
    category_image_content_type: Field::String,
    category_image_file_size: Field::Number,
    category_image_updated_at: Field::DateTime,
    parent_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :categories_products,
    :products,
    :parent,
    :children,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :categories_products,
    :products,
    :parent,
    :children,
    :id,
    :category_name,
    :category_description,
    :created_at,
    :updated_at,
    :category_image_file_name,
    :category_image_content_type,
    :category_image_file_size,
    :category_image_updated_at,
    :parent_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :categories_products,
    :products,
    :parent,
    :children,
    :category_name,
    :category_description,
    :category_image_file_name,
    :category_image_content_type,
    :category_image_file_size,
    :category_image_updated_at,
    :parent_id,
  ].freeze

  # Overwrite this method to customize how categories are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(category)
  #   "Category ##{category.id}"
  # end
end
