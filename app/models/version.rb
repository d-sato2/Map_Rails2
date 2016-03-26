require 'csv'
class Version < PaperTrail::Version
	def self.to_csv(options = {})
	    CSV.generate(options) do |csv|
			csv << csv_column_names
			all.each do |version|
				if version.reify
			        csv << version.csv_column_values
			    end
			end
	    end
	end

	def self.csv_column_names
	    %W(ID 更新年月日 自治体名 更新項目 更新前 更新後)
	end

	def csv_column_values
    @names = { "vender" => "契約ベンダ", "kyougi" => "HARP協議会", "kiban" => "HARP基盤", "el_kyodo" => "eLTax",
      "kokaike" => "公会計", "koumu" => "校務支援", "todoku" => "とどくん", "eac" => "電子申請", "frs" => "施設予約",
      "eps" => "電子調達", "ca" => "総合行政", "gw" => "GW", "cms" => "CMS", "mail" => "Mail", "bu" => "バックアップ",
      "rs" => "リソース", "ps" => "人事給与", "fn" => "ふるさと納税", "ns" => "任用支援", "ib" => "ICT-BCP", "memo_service" => "備考欄" }
	    [id, changeset.to_a[1][1][1], reify.cityname, @names[changeset.to_a[0][0]],
	     changeset.to_a[0][1][0], changeset.to_a[0][1][1]]
	end
end
