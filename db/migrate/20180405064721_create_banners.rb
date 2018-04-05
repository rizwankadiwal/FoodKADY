class CreateBanners < ActiveRecord::Migration[5.1]
  def change
    create_table :banners do |t|
      t.string :slideshow_banner_title
      t.string :slideshow_banner_subtitle
      t.string :long_banner_title
      t.string :long_banner_subtitle

      t.timestamps
    end
  end
end
