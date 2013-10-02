class Picture < ActiveRecord::Base

  has_many :votes, as: :voteable,
    #inverse_of: :picture,
    dependent: :destroy

  validates_presence_of :title
  mount_uploader :image, ImageUploader

  state_machine initial: :pending do
    event :approve do
      transition pending: :approved
    end

    event :reject do
      transition pending: :rejected
    end
  end 

  def score
    # binding.pry
    self.votes.inject(0) { |sum, v| sum + v.value }
  end

  def has_user_voted?(user_id)
    self.votes.map { |vote| vote.user_id }.include?(user_id)
  end

  def check_type?(data_type)
    type = data_type.split('/')
    if type[0] != 'image'
      return false
    else
      return true
    end
  end

end

