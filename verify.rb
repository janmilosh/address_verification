require_relative 'app/main.rb'

Main.new("#{ __dir__ }/app/data/#{ARGV[0]}").run.each { |address| puts address }
