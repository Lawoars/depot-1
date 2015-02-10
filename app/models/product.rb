class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :title, length: {minimum: 5, message: 'Длина названия должна быть больше 5 символов!'}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: "Адрес должен оканчиваться на расширения png, jpg, gif"
  }
  
  def self.latest
    return Product.order(:updated_at).last
  end
end
