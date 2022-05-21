class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string     :code,           null: false
      t.string     :name,           null: false
      t.references :subject_area,   null: false,  foreign_key: true
      t.timestamps
    end
  end
end
