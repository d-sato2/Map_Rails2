class CreateHvalues < ActiveRecord::Migration
  def change
    create_table :hvalues do |t|
      t.string :cityid
      t.string :cityname
      t.string :bureau
      t.text :memo_kiban
      t.text :memo_service
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
      t.integer :kyogi
      t.integer :kiban
      t.integer :el_kyodo
      t.integer :kokaike
      t.integer :koumu
      t.integer :todoku

      t.timestamps null: false
    end
  end
end
