require 'csv'

class Hvalue < ActiveRecord::Base

  has_paper_trail

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << csv_column_names
      all.each do |hvalue|
        csv << hvalue.attributes.values_at(*column_names)
      end
    end
  end

  def self.csv_column_names
    %W(ID cityid cityname 振興局 ttl gw frs ib ft rs ss eac eps bu pa et mail vender ns cms ca fn ps \u4F5C\u6210\u65E5\u6642 \u66F4\u65B0\u65E5\u6642)
  end

  def csv_column_values
    [id, cityid, cityname, ttl, gw, frs, ib, ft, rs, ss, eac, eps, bu, pa, et, mail, vender, ns, cms, ca, fn, ps]
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
