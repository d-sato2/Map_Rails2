class CreateHselections < ActiveRecord::Migration
  def change
    create_table :hselections do |t|
      t.string :gw
      t.string :ca
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
      t.string :fn
      t.string :ps
      t.string :el_kyodo
      t.string :kyougi
      t.string :kiban
      t.string :kokaike
      t.string :koumu
      t.string :todoku

      t.timestamps null: false
    end
  end
end
