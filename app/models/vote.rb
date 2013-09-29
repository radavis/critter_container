class Vote < ActiveRecord::Base
  belongs_to :voteable,
    polymorphic: true #, inverse_of: :vote

  validates_inclusion_of :value, in: [-1, 1]
end
