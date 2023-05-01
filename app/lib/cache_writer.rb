class CacheWriter
  def initialize(file, address_response)
    @file = file
    @address_response = address_response
  end
  
  def add_to_cache
    File.open(@file, 'a') do |f|
      f.puts @address_response
    end
  end
end
