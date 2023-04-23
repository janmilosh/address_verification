require 'csv'

class CSVParser
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def table
    t = CSV.parse(File.read(@file),
                  headers: true,
                  header_converters: :symbol,
                  strip: true,
                  skip_blanks: true)
    t.delete_if { |row| row.to_hash.values.all?(&:nil?) }
  end
end
