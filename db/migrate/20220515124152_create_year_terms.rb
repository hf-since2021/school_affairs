class CreateYearTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :year_terms do |t|
      t.references :year,       null: false,  foreign_key: true
      t.references :term,       null: false,  foreign_key: true
      t.string     :code,       null: false
      t.boolean    :activity,   null: false,  default: false
      t.timestamps
    end
  end
end
