class ResultsFormatter  
  def initialize(csv_data, results)
    @data = csv_data
    @results = results
    @output_strings = []
    @input_strings = []
    @valid_inputs = valid_inputs
  end

  def formatted_inputs_results
    parse_inputs_results
    inputs_results = []
    @data.each_with_index do |d, index|
      inputs_results << @input_strings[index] + @output_strings[index]
    end
    inputs_results
  end
  
  private

  def parse_inputs_results
    @data.each_with_index do |d, i|
      @input_strings[i] = formatted_input(d)
      if !@valid_inputs.include?(i)
        @output_strings[i] = 'Invalid Address'
      end
    end

    @results.each do |r|
      index = r['input_index']
      @output_strings[index] = formatted_output(r)
    end
  end
  
  def formatted_input(data)
    input_str = "#{data[:street]}, #{data[:city]}, #{data[:zip_code]} -> "
  end

  def formatted_output(result)
    output_str = "#{result["delivery_line_1"]}, #{result['components']['city_name']}, #{result['components']['zipcode']}-#{result['components']['plus4_code']}"
  end

  def valid_inputs
    valid = []
    @results.each do |result|
      valid << result['input_index']
    end
    valid
  end
end
