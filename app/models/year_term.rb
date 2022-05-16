class YearTerm < ApplicationRecord
  belongs_to :year
  belongs_to :term
  has_many   :users
end
