class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string      :code,             null: false
      t.string      :name,             null: false
      t.string      :school_grade
      t.string      :klass
      t.references  :subject,          null: false, foreign_key: true
      t.references  :year_term,        null: false, foreign_key: true
      t.references  :teacher,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
