require 'csv'
module Exportable
  extend ActiveSupport::Concern

  module ClassMethods
    def export_csv(options={col_sep:';'})
      CSV.generate(options) do |csv|
        csv << attribute_names
        all.each do |attr|
          csv << attr.attributes.values_at(*attribute_names)
        end
      end

    end
  end

end