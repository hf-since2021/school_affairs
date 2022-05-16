class UsersRole < ApplicationRecord
  belongs_to :year_term, optional: true
  belongs_to :user
end
