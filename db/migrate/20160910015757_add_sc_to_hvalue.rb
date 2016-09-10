class AddScToHvalue < ActiveRecord::Migration
  def change
    add_column :hvalues, :sc, :string
    add_column :hvalues, :sc_op1, :string
    add_column :hvalues, :sc_op2, :string
    add_column :hvalues, :sc_op3, :string
    add_column :hvalues, :sc_op4, :string
    add_column :hvalues, :sc_op5, :string
    add_column :hvalues, :sc_op6, :string
  end
end
