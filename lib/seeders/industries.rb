require 'csv'

module Seeders
  module Industries

    class << self
      def seed
        industries = []
        CSV.foreach("#{Rails.root}/db/data/industries.csv", headers: false) do |row|
          industries << row[2]
        end


        industries.each do |industry|
          entry = Industry.where(name: industry).first
          if entry.nil?
            entry = Industry.new
            entry.name = industry
          else
            industry.update_attributes(name: entry)
          end
          entry.save
        end
      end
    end

  end
end
