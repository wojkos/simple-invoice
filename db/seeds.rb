def createProduct(name, price, code)
  product = Product.find_or_create_by!(code: code) do |p|
    p.name = name
    p.price = price
    p.code = code
  end
  puts ' CREATED PRODUCT: ' << product.name.upcase << ": " << product.price.to_s << " (" << product.code << ")"
  # product
end

createProduct('Eloquent Ruby' , 99.99, 'A')
createProduct('Clean Ruby' , 100.00, 'B')
createProduct('The Well-Grounded Rubyist' , 200.00, 'C')
createProduct('Ruby Science' , 49.99, 'D')
createProduct('Confident Ruby' , 50.00, 'E')