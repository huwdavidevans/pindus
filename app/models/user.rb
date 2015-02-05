class User < ActiveRecord::Base

  include RoleModel

  after_initialize :set_default_role, :if => :new_record?

  def self.valid_roles
    [:admin, :moderator, :contributer, :viewer, :banned]
  end

  def set_default_role
    self.roles << :contributer
  end

  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :pics
end
