require 'csv'

class Hvalue < ActiveRecord::Base
  has_many :hcontacts

  has_paper_trail

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << csv_column_names
      all.each do |hvalue|
        csv << hvalue.csv_column_values
      end
    end
  end

  def self.csv_column_names
    %W(ID 自治体コード 自治体名 振興局 人口 GW 施設予約 ICT-BCP とどくん
      リソース 校務支援 電子申請 電子調達 バックアップ 公会計 eLTax Mail 契約ベンダ
      任用支援 CMS 総合行政 ふるさと納税 人事給与 作成日時 更新日時 HARP協議会
      HARP基盤 eLTax 公会計 校務 とどくん 備考欄２ 備考欄１)
  end

  def csv_column_values
    [id, cityid, cityname, bureau, ttl, gw, frs, ib, ft,
      rs, ss, eac, eps, bu, pa, et, mail, vender,
      ns, cms, ca, fn, ps, created_at, updated_at, kyougi,
      kiban, el_kyodo, kokaike, koumu, todoku, memo_kiban, memo_service]
  end

  def self.search(search)
    if search.present?
      Hvalue.where('cityname like ?', "%#{search}%")
    else
      Hvalue.none
    end
  end

  def self.search_bureau(search_bureau)
    if search_bureau
      Hvalue.where('bureau like ?', "%#{search_bureau}%")
    else
      Hvalue.none
    end
  end
end
