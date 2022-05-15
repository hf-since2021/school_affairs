class RolifyCreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table(:roles) do |t|
      t.string :name, null: false
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_roles, :id => false) do |t|
      t.references :user
      t.references :role
      # どの学期にログインするか
      t.references :year_term, null: false, foreign_key: true
    end
    
    add_index(:roles, :name)
    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:users_roles, [ :user_id, :role_id ])
  end
end
