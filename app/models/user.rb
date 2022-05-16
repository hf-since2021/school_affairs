class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validatableにはemailのuniquenessのバリデーションが定義されているので除外
  # 自前でvalidationをいれること！
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable#, :validatable

  has_many   :users_role
  belongs_to :year_term
  has_one    :year,  through: :year_term
  has_one    :term,  through: :year_term
end
