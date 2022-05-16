class Year < ApplicationRecord
  has_many :year_terms
  has_many :user,  through: :year_term
end
