class CreateAnnualStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :annual_students do |t|
      t.references	:year,          null: false, foreign_key: true
      t.references	:student,       null: false, foreign_key: true
      t.string	    :school_grade
      t.string	    :klass
      t.string	    :number
      t.timestamps
    end
  end
end
