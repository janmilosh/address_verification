class ResultsFormatter  
  def initialize(csv_data, results)
    @data = csv_data
    @results = results
    @clean_results = clean_results
  end

  def formatted_inputs_results
    inputs_results = []
    @data.each_with_index do |input, input_index|
      if !@clean_results.has_key?(input_index)
        inputs_results << add_formatted_output(input, 'invalid')
      else
        @clean_results[input_index].each_with_index do |result_str, candidate_index|
          inputs_results << add_formatted_output(input, candidate_index, result_str)
        end
      end
    end
    inputs_results
  end
  
  private

  def add_formatted_output(input, key, result_str = '')
    base = "#{input[:street]}, #{input[:city]}, #{input[:zip_code]}"
    outputs = {
      'invalid' => base + ' -> Invalid Address',
      0 => base + ' -> ' + result_str,
      'blank' => ' ' * base.length + ' -> ' + result_str
    }
    outputs.fetch(key, outputs['blank'])
  end
  
  def clean_results
    clean = {}
    @results.each do |result|
      input_index = result['input_index']
      result_str = result_output_string(result)
      if !clean.has_key?(input_index)
        clean[input_index] = [result_str]
      else
        clean[input_index] << result_str
      end
    end
    clean
  end

  def result_output_string(result)
    c = result['components']
    "#{result["delivery_line_1"]}, #{c['city_name']}, #{c['zipcode']}-#{c['plus4_code']}"
  end
end
