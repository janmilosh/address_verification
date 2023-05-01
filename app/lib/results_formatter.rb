class ResultsFormatter  
  def initialize(address, result)
   @address = address
   @result = result.first
  end

  def formatted_address
    base = "#{@address[:street]}, #{@address[:city]}, #{@address[:zip_code]}"
    if @result
      base + ' -> ' + result_string
    else
      base + ' -> Invalid Address'
    end
  end

  private

  def result_string
    c = @result['components']
    "#{@result["delivery_line_1"]}, #{c['city_name']}, #{c['zipcode']}-#{c['plus4_code']}"
  end
end
