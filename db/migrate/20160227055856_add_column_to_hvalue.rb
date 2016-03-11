class AddColumnToHvalue < ActiveRecord::Migration
  def change
    add_column :hvalues, :kyougi, :string
    add_column :hvalues, :kiban, :string
    add_column :hvalues, :el_kyodo, :string
    add_column :hvalues, :kokaike, :string
    add_column :hvalues, :koumu, :string
    add_column :hvalues, :todoku, :string
    add_column :hvalues, :memo_kiban, :text
    add_column :hvalues, :memo_service, :text
  end
end
