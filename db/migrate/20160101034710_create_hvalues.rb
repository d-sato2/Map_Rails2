class CreateHvalues < ActiveRecord::Migration
  def change
    create_table :hvalues do |t|
      t.string :cityid
      t.string :cityname
      t.string :bureau
      t.string :ttl
      t.string :gw
      t.string :frs
      t.string :ib
      t.string :ft
      t.string :rs
      t.string :ss
      t.string :eac
      t.string :eps
      t.string :bu
      t.string :pa
      t.string :et
      t.string :mail
      t.string :vender
      t.string :ns
      t.string :cms
      t.string :ca
      t.string :fn
      t.string :ps

      t.timestamps null: false
    end
  end
end
