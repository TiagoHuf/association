# config/initializers/audited.rb

require 'bigdecimal'
require 'yaml'

YAML.add_domain_type("ruby/object:BigDecimal", "BigDecimal") { |type, val| BigDecimal.new(val) }
