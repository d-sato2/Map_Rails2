class RemoveMemo2FromHcontact < ActiveRecord::Migration
  def change
    remove_column :hcontacts, :memo2, :string
  end
end
