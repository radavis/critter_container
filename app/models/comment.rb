class Comment < ActiveRecord::Base

  validates_presence_of :comment 
  validates_length_of :comment, 
    :minimum => 8,
    :maximum => 330,
    :short => "Tell us more! (Add some words)"
  
  validates_presence_of :user_id
  validates_presence_of :picture_id

has_many :votes, as: :voteable,
    dependent: :destroy

  belongs_to :user,
    inverse_of: :comments

  belongs_to :picture,
    inverse_of: :comments


def score
    self.votes.inject(0) { |sum, v| sum + v.value }
  end

  def has_user_voted?(user_id)
    self.votes.map { |vote| vote.user_id }.include?(user_id)
  end

end
