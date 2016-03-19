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
	    %W(ID 更新年月日 自治体名 項目 更新前 更新後)
	end

	def csv_column_values
	    [id, changeset.to_a[1][1][1], reify.cityname, changeset.to_a[0][0],
	     changeset.to_a[0][1][0], changeset.to_a[0][1][1]]
	end
end