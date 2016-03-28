class AddColumnToHcontact < ActiveRecord::Migration
  def change
    add_column :hcontacts, :mailAddress2, :string
  end
end
