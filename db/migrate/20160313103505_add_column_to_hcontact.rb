class AddColumnToHcontact < ActiveRecord::Migration
  def change
    add_column :hcontacts, :mail2, :string
  end
end
