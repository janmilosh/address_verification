require 'csv'

class CSVParser
  attr_reader :file, :table

  def initialize(file)
    @file = file
    @table = csv_table
  end

  def csv_table
    t = CSV.parse(File.read(@file),
              headers: true,
              header_converters: :symbol,
              strip: true,
              skip_blanks: true)
    t.delete_if { |row| row.to_hash.values.all?(&:nil?) }
  end
end
