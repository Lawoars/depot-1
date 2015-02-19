class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :title, length: {minimum: 5, message: 'Длина названия должна быть больше 5 символов!'}
  has_attached_file :image_url, :styles => { :small => "150x150>" },
                    :url  => "/assets/images/:basename.:extension",
                    :path => ":rails_root/public/assets/images/:basename.:extension"

  validates_attachment_presence :image_url
  validates_attachment_size :image_url, :less_than => 5.megabytes
  validates_attachment_content_type :image_url, :content_type => ['image/jpeg', 'image/png']
  
  has_many :line_items
  has_many :orders, through: :line_items
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Товар находится в корзине')
      return false
    end
  end
  
  def self.latest
    return Product.order(:updated_at).last
  end
end
