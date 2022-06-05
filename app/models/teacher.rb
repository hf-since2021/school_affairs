class Teacher < ApplicationRecord
  belongs_to :user,      optional: true
  belongs_to :subjects,  optional: true
  has_many :annual_teachers
end
