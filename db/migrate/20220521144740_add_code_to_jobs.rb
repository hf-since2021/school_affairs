class AddCodeToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :code, :string, null: false
  end
end
