class User < ActiveRecord::Base

  include RoleModel
  
  def self.valid_roles
    [:admin, :moderator, :contributer, :viewer, :banned]
  end

  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :pics
end
