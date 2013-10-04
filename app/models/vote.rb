class Vote < ActiveRecord::Base
  belongs_to :voteable,
    polymorphic: true #, inverse_of: :vote

  belongs_to :user,
    inverse_of: :votes

  validates :user_id, uniqueness:{ scope: [:voteable_id, :voteable_type] }

  validates_inclusion_of :value, in: [-1, 1]
end
