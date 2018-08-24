class Group < ApplicationRecord
  #validation
  validates :name, presence: true

  #association
  has_many :group_users
  has_many :users,    through: :group_users
  has_many :messages
end
