class Post < ActiveRecord::Base 
  include Sluggable
  include Voteable
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories 
  has_many :categories, through: :post_categories
  validates :description, presence: true  
  validates :title, presence: true, length: {minimum: 5}
  validates :url, presence: true, uniqueness: true 
  sluggable_column :title
end


