class CreateHvalues < ActiveRecord::Migration
  def change
    create_table :hvalues do |t|
      t.string :cityid
      t.string :N03_004
      t.string :bureau
      t.integer :ttl
      t.integer :gw
      t.integer :frs
      t.integer :ib
      t.integer :ft
      t.integer :rs
      t.integer :ss
      t.integer :eac
      t.integer :eps
      t.integer :bu
      t.integer :pa
      t.integer :et
      t.integer :mail
      t.integer :vender
      t.integer :ns
      t.integer :cms
      t.integer :ca
      t.integer :fn
      t.integer :ps

      t.timestamps null: false
    end
  end
end
