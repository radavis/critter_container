class Picture < ActiveRecord::Base
  has_many :votes, as: :voteable,
    #inverse_of: :picture,
    dependent: :destroy

  validates_presence_of :title

  def score
    # binding.pry
    self.votes.inject(0) { |sum, v| sum + v.value }
  end

  def has_user_voted?(user_id)
    self.votes.map { |vote| vote.user_id }.include?(user_id)
  end
end
