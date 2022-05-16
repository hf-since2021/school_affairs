class AddYearTermToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :year_term, foreign_key: true
  end
end
