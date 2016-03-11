require "thor"

# Service Generator Class.
class ServiceGenerator < Thor::Group
	include Thor::Actions

	# Defines the templates path.
	def self.source_root
		File.join(File.dirname(__FILE__), 'templates')
	end

	argument :name
	# Responsible to generate the named service inside lib/services path
	# of working directory.
	def generate
		template('service.tt', "lib/services/#{name}_service.rb")
	end
end

# CLI command registrator.
class CLI < Thor
	register ServiceGenerator, "generate:service", "generate:service <service_name>", "Generates a service skeleton."
end
