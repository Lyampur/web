class RoleUser < ActiveRecord::Base
  belongs_to :role
  belongs_to :user, inverse_of: :role_users

  validates :role, presence: true
  validates :user, presence: true

  Role::ROLE_FOR_METHODS.each do |rname|
    define_method "is_#{rname}?" do
      self.role.name == rname
    end
  end
end
