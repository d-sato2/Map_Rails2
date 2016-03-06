module PaperTrail
	require 'csv'
	class Version < ActiveRecord::Base

		def self.to_csv(options = {})
		    CSV.generate(options) do |csv|
				csv << column_names
					all.each do |hvalue|
					csv << hvalue.attributes.values_at(*column_names)
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
