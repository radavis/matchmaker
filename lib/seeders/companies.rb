# companies.rb

require 'csv'
require 'pry'

module Seeders
  module Companies
    class << self

      def companies
        results = []
        CSV.foreach("#{Rails.root}/db/data/companies.csv",
          headers: true,
          header_converters: :symbol) do |row|
          results << row.to_hash
        end
        normalize(results)
      end

      def normalize(records)
        columns = [ :name, :email, :city, :state, :description, :telecommute, :size, :year_founded, :industry_id ]

        #puts 'enter normalize'
        records.each do |record|

          # if record[:industry]
          #   industry = Industry.find_by(name: record[:industry])

          #   if !industry.nil?
          #     record[:industry] = industry.id
          #   else
          #     industry = Industry.create!(name: record[:industry])
          #     record[:industry_id] = industry.id
          #   end

          # else
          #   record[:industry_id] = Industry.find_by(name: "Computer Software").id
          # end

          record[:description] = record[:company_info]
          record[:industry_id] = Industry.find_by(name: "Computer Software").id
          record[:name] = record[:company]
          record[:email] = "hr@#{record[:name].parameterize.underscore}.com" if record[:email].nil?
          record[:telecommute] = false if record[:telecommute].nil?
          record[:year_founded] = 2013 if record[:year_founded].nil?
          record[:description] = "Sorry, no description available." if record[:description].nil?
          record[:city] = record[:town]
          record[:size] = "Funded (25-100)"

          record.keep_if { |k, v| columns.include?(k) }

        end
      end

      def seed
        Seeders::Companies.companies.each do |company|
          entry = Company.find_by(name: company[:name])

          if entry.nil?
            entry = Company.new(company)
          else
            entry.update_attributes(company)
          end
          #binding.pry
          entry.save!
        end
      end

    end
  end
end
