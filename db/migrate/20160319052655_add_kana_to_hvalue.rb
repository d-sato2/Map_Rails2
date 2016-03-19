class AddKanaToHvalue < ActiveRecord::Migration
  def change
    add_column :hvalues, :citynameKana, :string
  end
end
