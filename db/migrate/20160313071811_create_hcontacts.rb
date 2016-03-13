class CreateHcontacts < ActiveRecord::Migration
  def change
    create_table :hcontacts do |t|
      t.string :bureau
      t.string :cityname
      t.string :service
      t.string :department
      t.string :person
      t.string :phone
      t.string :mail
      t.text :memo
      t.references :hvalue, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :hcontacts, [:hvalue_id, :created_at]
  end
end
