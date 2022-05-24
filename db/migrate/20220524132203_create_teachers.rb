class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string      :code,                 null: false
      t.string      :last_name,            null: false
      t.string      :first_name,           null: false
      t.string      :last_name_reading,    null: false
      t.string      :first_name_reading,   null: false
      t.references  :subject_area,         foreign_key: true
      t.timestamps
    end
  end
end
