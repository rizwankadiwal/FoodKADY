class AddBannerLinkToBanners < ActiveRecord::Migration[5.1]
  def change
    add_column :banners, :banner_link, :string
  end
end
