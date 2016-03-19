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
    %W(ID 自治体コード 自治体名 振興局 HARP協議会 HARP基盤 電子申請 施設予約
      電子調達 総合行政 公会計 とどくん GW CMS リソース 人事給与 ふるさと納税
      eLTax 校務 任用支援 Mail バックアップ ICT-BCP 契約ベンダ 備考欄２ 備考欄１
       作成日時 更新日時
       )
  end

  def csv_column_values
    [id, cityid.slice!(2, 6), cityname, bureau, changeWordForKyougi(kyougi),
      changeWord(kiban), changeWord(eac), changeWord(frs),
      changeWord(eps), changeWord(ca), changeWord(kokaike), changeWord(todoku),
      changeWord(gw), changeWord(cms), changeWord(rs), changeWord(ps), changeWord(fn),
      changeWord(el_kyodo), changeWord(koumu), changeWord(ns), changeWord(mail),
      changeWord(bu), changeWord(ib), vender, memo_kiban, memo_service,
      created_at, updated_at]
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
      Hvalue.where('cityname like ? OR citynameKana like ? ', "%#{search}%", "%#{search}%")
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
