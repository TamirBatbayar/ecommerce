class Product < ActiveRecord::Base
  belongs_to :user

  has_attached_file :picture, styles: { medium: "600x600>", thumb: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  validates :picture, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :detail, presence: true
  validates :category, presence: true
end
