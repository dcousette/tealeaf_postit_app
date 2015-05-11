class Comment < ActiveRecord::Base 
  belongs_to :post
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

  validates :body, presence: true
  has_many :votes, as: :voteable
  
  def total_votes
    self.up_votes - self.down_votes
  end

  def up_votes
    self.votes.where(value: true).size
  end 

  def down_votes
    self.votes.where(value: false).size
  end
end
