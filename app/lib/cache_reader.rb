class CacheReader
  def initialize(file, address)
    @file = file
    @line = "#{address[:street]}, #{address[:city]}, #{address[:zip_code]}"
  end

  def cached_address
    IO.foreach(@file) do |str|
      return str.strip if str.start_with?(@line)
    end
    false
  end
end
