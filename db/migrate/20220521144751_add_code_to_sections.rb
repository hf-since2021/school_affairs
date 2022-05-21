class AddCodeToSections < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :code, :string, null: false
    # column_options: { null: false }
  end
end
