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
    %W(ID 自治体コード 自治体名 振興局 人口 GW 施設予約 ICT-BCP
      リソース 電子申請 電子調達 バックアップ Mail 契約ベンダ
      任用支援 CMS 総合行政 ふるさと納税 人事給与 作成日時 更新日時 HARP協議会
      HARP基盤 eLTax 公会計 校務 とどくん 備考欄２ 備考欄１)
  end

  def csv_column_values
    [id, cityid, cityname, bureau, ttl, changeWord(gw),
      changeWord(ib), changeWord(ft), changeWord(rs),
      changeWord(eac), changeWord(eps), changeWord(bu),
      changeWord(mail), vender, changeWord(ns),
      changeWord(cms), changeWord(ca), changeWord(fn),
      changeWord(ps), created_at, updated_at, changeWordForKyougi(kyougi),
      changeWord(kiban), changeWord(el_kyodo),
      changeWord(kokaike), changeWord(koumu), changeWord(todoku),
      memo_kiban, memo_service]
  end

  def changeWord(aaa)
    if aaa == "導入"
      aaa = "○"
    elsif aaa == "未導入"
      aaa = ""
    end
  end

  def changeWordForKyougi(aaa)
    if aaa == "参加"
      aaa = "○"
    else
      aaa = ""
    end
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
