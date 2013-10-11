require 'csv'

module Seeders
  module Industries

    class << self

      def industries
        industries = []
        CSV.foreach("#{Rails.root}/db/data/industries.csv", headers: false) do |row|
          industries << row[2]
        end
        industries
      end

      def seed
        Seeders::Industries.industries.each do |industry|

          entry = Industry.where(name: industry).first
          if entry.nil?
            entry = Industry.new
            entry.name = industry
          else
            entry.update_attributes(name: industry)
          end
          entry.save!
        end
      end
    end

  end
end
