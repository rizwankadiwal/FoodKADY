namespace :import do
  desc 'Importing CSV to Database'
  task products: :environment do
    filename = File.join Rails.root, 'csv/import.csv'
    counter = 0
    CSV.foreach(filename, headers: true) do |row|
      product = Product.create(product_name: row["product_name"], sku: row["sku"],
                               stock_quantity: row["stock_quantity"],
                     cost: row["cost"], price: row["price"], is_available: row["is_available"],
                     taxable_class: row["taxable_class"], product_image_file_name: row["product_image_file_name"],
                     product_image_content_type: row["product_image_content_type"])
      puts " #{product.errors.full_messages.join(",")}" if product.errors.any?
      counter += 1 if product.persisted?
      puts "#{counter}"
    end
    puts "Imported #{counter} products"
  end
end