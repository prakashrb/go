class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_roles
  has_many :roles, through: :user_roles
  accepts_nested_attributes_for :roles, :allow_destroy => true

  before_create :add_token

  def add_token
    self.token = SecureRandom.urlsafe_base64(nil, false)
  end

  def to_xml
  	user_roles = roles.collect(&:to_xml)
  	arrr = {id: id, email: email}
  	arrr.merge(user_roles: user_roles).to_xml
  end
end
