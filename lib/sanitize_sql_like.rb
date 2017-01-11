require "sanitize_sql_like/version"
require 'active_record'

if Gem::Version.new(ActiveRecord::VERSION::STRING) < Gem::Version.new('4.2.1')
  module ActiveRecord
    module Sanitization
      module ClassMethods
      	if not method_defined?(:sanitize_sql_like)
	        def sanitize_sql_like(string, escape_character = "\\")
	          pattern = Regexp.union(escape_character, "%", "_")
	          string.gsub(pattern) { |x| [escape_character, x].join }
	        end
        end
      end
    end
  end
end
