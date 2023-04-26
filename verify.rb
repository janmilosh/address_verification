require_relative 'app/main.rb'

Main.new("#{ __dir__ }/app/data/#{ARGV[0]}", ARGV[1].to_i).run.each { |address| puts address }
