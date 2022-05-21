class AddCodeToResponsibilities < ActiveRecord::Migration[6.0]
  def change
    add_column :responsibilities, :code, :string, null: false
  end
end
