class CreateHservices < ActiveRecord::Migration
  def change
    create_table :hservices do |t|
      t.string :keyName
      t.string :serviceName
      t.text :comment
      t.integer :kibanRelation

      t.timestamps null: false
    end
  end
end
