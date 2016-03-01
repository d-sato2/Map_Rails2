class AddColumnToHvalue < ActiveRecord::Migration
  def change
<<<<<<< HEAD
    add_column :hvalues, :kyogi, :integer
=======
    add_column :hvalues, :kyougi, :integer
>>>>>>> new_branch_name
    add_column :hvalues, :kiban, :integer
    add_column :hvalues, :el_kyodo, :integer
    add_column :hvalues, :kokaike, :integer
    add_column :hvalues, :koumu, :integer
    add_column :hvalues, :todoku, :integer
    add_column :hvalues, :memo_kiban, :text
    add_column :hvalues, :memo_service, :text
  end
end
