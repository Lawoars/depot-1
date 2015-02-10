require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  
  # test "the truth" do
  #   assert true
  # end
  
  def new_product(image_url)
    product = Product.new(title: 'title', description: 'desc', price: 10, image_url: image_url)
    return product
  end
  
  test 'products attribs must be not empty' do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end
  
  test 'price must be positive and more than 0.01' do
    product = Product.new(title: 'title',
                          description: 'description',
                          image_url: 'url.jpg'
                        )
    #Цена должна быть неотрицательной
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]
      
    #Цена должна быть больше нуля
    product.price = -0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]
    
    product.price = 1
    assert product.valid?
  end
  
  test 'image url must take a picture' do
    ok = ['fred.jpg', 'colon.PNG', 'sam.Gif', 'Rincewind.jPg']
    bad = ['mark.doc', 'pork.exe', 'foo.bar', 'new.jpeg.html']
    
    ok.each { |item| assert new_product(item).valid?, "#{item} не должен быть некорректным"  }
    bad.each { |item| assert new_product(item).invalid?, "#{item} не должен быть корректным" }
  end
  
  test 'title must be unique' do
    product = Product.new(title: products(:ruby).title,
                          description: 'test_desc',
                          image_url: 'img.jpg',
                          price: 19.99
                        )
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end
end
