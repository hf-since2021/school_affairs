class Teacher < ApplicationRecord
  belongs_to :user
  has_many   :annual_teachers
end
