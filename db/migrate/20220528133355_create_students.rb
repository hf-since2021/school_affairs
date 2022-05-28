class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string	  :code,                null: false
      t.string	  :last_name,           null: false
      t.string	  :first_name,          null: false
      t.string	  :last_name_reading,   null: false
      t.string	  :first_name_reading,  null: false
      t.integer	  :sex,                 unsigned: true, limit: 1, null: false, default: 0
      t.timestamps
    end
  end
end
