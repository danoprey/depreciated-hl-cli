module HyperledgerCli
  module ErrorPrinter
    def print_error(err)
      puts "Error: #{err}"
      errors = JSON.parse(err.response, symbolize_names: true)[:errors]
      if errors
        errors.each do |k, v| puts "#{k}:\t#{v.join(', ')}" end
      end
    end
  end
end
