class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :votes,
    inverse_of: :user

  has_many :comments,
    inverse_of: :user

  has_many :pictures,
    inverse_of: :user,
    dependent: :destroy

  validates_presence_of :username
  validates_presence_of :email

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
