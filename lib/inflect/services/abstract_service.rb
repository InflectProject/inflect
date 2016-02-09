module Inflect
	# Acts as an specification or standard required for a Service 
	# Class to be consumed by the application. A Service Class is 
	# just a wrapper for any possible service you'd like to give 
	# support to, just by having four prerequisites.
	# 
	# @todo Define a standard procedure for securing the AbtractService 
	# 	interface, extract the NoMethodError exception a more suitable one, 
	# 	like MethodNotDefinedError.
	class AbstractService			
		# A WORDS Array constant with the key words of the Service.
		# @example Array for New York Times service
		# 	WORDS = %W[ NEWS TODAY NEW\ YORK\ TIMES]	
		WORDS = []

		# In case there are modules that provide similar contents the
		# one with most PRIORITY is picked.
		PRIORITY = 0 	
		
		# Receives an Array of words and returns true or false depending
		# if the Service can handle the request given by the words.
		# 	
		# @param words [Array] an Array of strings with key words.
		# @return [Boolean]
		def self.valid?(words)
			message = "#{self.class} must implement valid? method,
					   for more imformation see AbstractService class."
			raise NoMethodError.new message
		end

		# Returns a Hash with retrieved data.
		#
		# @param words [Array] an Array of strings with key words.
		# @todo Define a standard format for the handle response.
		def self.handle(words)
			message = "#{self.class} must implement handle method,
					   for more imformation see AbstractService class."
			raise NoMethodError.new message
		end
	end
end