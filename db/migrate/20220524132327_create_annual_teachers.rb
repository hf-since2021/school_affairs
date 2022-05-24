class CreateAnnualTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :annual_teachers do |t|
      t.references    :teacher,         null: false, foreign_key: true
      t.references    :year,            null: false, foreign_key: true
      t.references    :job,             foreign_key: true
      t.references    :section,         foreign_key: true
      t.references    :responsibility,  foreign_key: true
      t.string        :school_grade
      t.string        :klass
      t.timestamps
    end
  end
end








