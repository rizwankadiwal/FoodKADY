namespace :import do
  desc 'Importing CSV to Database'
  task products: :environment do
    filename = File.join Rails.root, 'csv/products.csv'
    counter = 0
    CSV.foreach(filename, headers: true) do |row|
      product = Product.create(product_name: row["product_name"], sku: row["sku"],
                               id: row["id"],
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

  task categories: :environment do
    filename = File.join Rails.root, 'csv/categories.csv'
    counter = 0
    CSV.foreach(filename, headers: true) do |row|
      category = Category.create(id: row["id"],category_name: row["category_name"],
                                 parent_id: row["parent_id"])
      puts " #{category.errors.full_messages.join(",")}" if category.errors.any?
      counter += 1 if category.persisted?
      puts "#{counter}"
    end
    puts "Imported #{counter} category"
  end

  task categories_product: :environment do
    filename = File.join Rails.root, 'csv/categories_product.csv'
    counter = 0
    CSV.foreach(filename, headers: true) do |row|
      categories_product = CategoriesProduct.create(category_id: row["category_id"], product_id: row["product_id"])
      puts " #{categories_product.errors.full_messages.join(",")}" if categories_product.errors.any?
      counter += 1 if categories_product.persisted?
      puts "#{counter}"
    end
    puts "Imported #{counter} categories_product"
  end
end