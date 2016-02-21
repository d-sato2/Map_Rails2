class CreateJapans < ActiveRecord::Migration
  def change
    create_table :japans do |t|
      t.string :city_id
      t.string :name_local

      t.timestamps null: false
    end
  end
end
