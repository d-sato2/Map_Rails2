class RemoveKyogiFromHvalue < ActiveRecord::Migration
  def change
    remove_column :hvalues, :kyogi, :integer
  end
end
