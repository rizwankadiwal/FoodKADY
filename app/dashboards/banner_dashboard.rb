require "administrate/base_dashboard"

class BannerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    slideshow_banner_title: Field::String,
    slideshow_banner_subtitle: Field::String,
    long_banner_title: Field::String,
    long_banner_subtitle: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    banner_image_file_name: Field::String,
    banner_image_content_type: Field::String,
    banner_image_file_size: Field::Number,
    banner_image_updated_at: Field::DateTime,
    banner_link: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :slideshow_banner_title,
    :slideshow_banner_subtitle,
    :long_banner_title,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :slideshow_banner_title,
    :slideshow_banner_subtitle,
    :long_banner_title,
    :long_banner_subtitle,
    :created_at,
    :updated_at,
    :banner_image_file_name,
    :banner_image_content_type,
    :banner_image_file_size,
    :banner_image_updated_at,
    :banner_link,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :slideshow_banner_title,
    :slideshow_banner_subtitle,
    :long_banner_title,
    :long_banner_subtitle,
    :banner_image_file_name,
    :banner_image_content_type,
    :banner_image_file_size,
    :banner_image_updated_at,
    :banner_link,
  ].freeze

  # Overwrite this method to customize how banners are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(banner)
  #   "Banner ##{banner.id}"
  # end
end
