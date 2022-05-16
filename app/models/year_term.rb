class YearTerm < ApplicationRecord
  belongs_to :year
  belongs_to :term
  has_many :users_roles
  has_many :users,   through: :users_roles
end
