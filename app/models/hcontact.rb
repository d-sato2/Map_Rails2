class Hcontact < ActiveRecord::Base
	has_paper_trail
	belongs_to :hvalue
end
