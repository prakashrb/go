class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles

  def to_xml
  	{name: name}
  end
end
