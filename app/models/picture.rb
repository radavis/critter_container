class Picture < ActiveRecord::Base
  has_many :votes, as: :voteable,
    #inverse_of: :picture,
    dependent: :destroy

  validates_presence_of :title

  def score
    self.votes.inject { |v, sum| v.value + sum }
  end
end
