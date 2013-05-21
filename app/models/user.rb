# Model to represent authenticationm, used with Devise and Cancan, see Ability
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :token_authenticatable,
         :recoverable, :rememberable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  # attr_accessible :title, :body

  # Simple function to test if our user is an admin
  # returns true if admin
  def admin?
    role == 'admin'
  end
end
