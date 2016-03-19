PaperTrail::Rails::Engine.eager_load!
module PaperTrail
	require 'csv'
	class Version < ActiveRecord::Base
		def self.to_csv(options = {})
		    CSV.generate(options) do |csv|
				csv << csv_column_names
				all.each do |version|
			        csv << version.csv_column_values
				end
		    end
		end

		def self.csv_column_names
		    %W(ID 自治体コード)
		end

		def csv_column_values
		    [id, changeset]
		end
	end
end