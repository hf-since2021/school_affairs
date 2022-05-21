class CreateResponsibilities < ActiveRecord::Migration[6.0]
  def change
    create_table :responsibilities do |t|
      t.string  :name,  null: false
      t.timestamps
    end
  end
end
