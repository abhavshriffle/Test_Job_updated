if ENV['COVERAGE']
  require 'simplecov'

  SimpleCov.start 'rails' do
    add_filter '/spec/'
    add_filter '/config/'
    add_filter '/vendor/'
    add_filter '/db/'

    # Additional configuration can be added here
  end
end

# if ENV['RAILS_ENV'] == 'test'
#   require 'simplecov'
#   SimpleCov.start 'rails'
#   puts "required simplecov"
# end
