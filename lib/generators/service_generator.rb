require "thor"

class ServiceGenerator < Thor::Group
	include Thor::Actions

	def self.source_root
		File.join(File.dirname(__FILE__), 'templates')
	end

	argument :name
	def generate
		template('service.tt', "lib/services/#{name}_service.rb")
	end
end

class CLI < Thor
	register ServiceGenerator, "generate:service", "generate:service <service_name>", "Generates a service skeleton."
end
