require 'pp'

module HyperledgerCli
  module ErrorPrinter
    def print_error(err)
      puts "Error: #{err}"
      pp err.response
    end
  end
end
