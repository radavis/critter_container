class Comment < ActiveRecord::Base

  validates_presence_of :comment 
  validates_length_of :comment, 
    :minimum => 8,
    :maximum => 330,
    :short => "Tell us more! (Add some words)"
  
  validates_presence_of :user_id
  validates_presence_of :picture_id

  belongs_to :user,
    inverse_of: :comments

  belongs_to :picture,
    inverse_of: :comments
end
