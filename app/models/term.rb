class Term < ApplicationRecord
  has_many :year_terms
  has_many :users,  through: :year_term
end
