class AddSectionToResponsibilities < ActiveRecord::Migration[6.0]
  def change
    add_reference :responsibilities, :section, foreign_key: true
  end
end
