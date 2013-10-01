class Vote < ActiveRecord::Base
  belongs_to :voteable,
    polymorphic: true #, inverse_of: :vote

  belongs_to :user

  validates_inclusion_of :value, in: [-1, 1]
end
