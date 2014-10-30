["models"].each do |f|
  require File.join(File.dirname(__FILE__), '..', "lib/#{f}.rb")
end

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.expect_with :rspec do |c|
    c.syntax = [:expect]
  end
end
