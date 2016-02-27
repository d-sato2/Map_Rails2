class AddKyogiToHvalue < ActiveRecord::Migration
  def change
    add_column :hvalues, :kyougi, :integer
  end
end
