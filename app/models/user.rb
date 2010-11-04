class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :posts
  has_many :tasks # Fk poiting to tasks bidded by the user
                  # Task owner user can be derived from post's owner
  has_many :comments, :dependent => :destroy
  has_many :bids, :dependent => :destroy
end
