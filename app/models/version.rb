module PaperTrail
	require 'csv'
	class Version < ActiveRecord::Base

		def self.to_csv(options = {})
			CSV.generate(options) do |csv|
				csv << csv_column_names
				# column_namesはカラム名を配列で返す
				# 例: ["id", "name", "price", "released_on", ...]
				all.each do |verion|
				csv << version.csv_column_values
				# attributes はカラム名と値のハッシュを返す
				# 例: {"id"=>1, "name"=>"レコーダー", "price"=>3000, ... }
				# valudes_at はハッシュから引数で指定したキーに対応する値を取り出し、配列にして返す
				# 下の行は最終的に column_namesで指定したvalue値の配列を返す
				end
			end
		end

		def self.csv_column_names
			%W(ID cityid cityname 振興局 ttl gw frs ib ft rs ss eac eps bu pa et mail vender ns cms ca fn ps \u4F5C\u6210\u65E5\u6642 \u66F4\u65B0\u65E5\u6642)
		end

		def csv_column_values
			[changeset]
		end
	end
end
