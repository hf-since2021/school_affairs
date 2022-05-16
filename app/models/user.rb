class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validatableにはemailのuniquenessのバリデーションが定義されているので除外
  # 自前でvalidationをいれること！
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable#, :validatable

  has_one  :users_role
  has_one  :year_term,   through: :users_role
end