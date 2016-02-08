module Inflect	
	class AbstractService
		# AbstractService acts as an specification or standard required
		# for a Service Class to be consumed by the application. A Service 
		# Class is just a wrapper for any possible service you'd like to 
		# give support to, just by having four prerequisites:
		# 
		# 	- A WORDS Array constant with the key words of the Service,
		# 	for example:
		# 		
		# 		class NewYorkTimesService
		# 			
		# 			WORDS = %W[ NEWS TODAY NEW\ YORK\ TIMES]
		# 			#...
		# 		end
		WORDS = []

		# 	- A PRIORITY constant with the priority that will be given to
		# 	the service in case there are modules that provide similar 
		# 	contents, if no PRIORITY is given, it is given 0 by default.
		#
		PRIORITY = 0 	
		# 	- A valid?(words) method, that receives an Array of 
		# 	words and returns either true or false, depending on the 
		# 	WORDS Array.
		#
		def self.valid?(words)
			message = "#{self.class} must implement valid? method,
					   for more imformation see AbstractService class."
			raise NoMethodError.new message
		end

		# 	- A handle(words) method that returns a JSON response (or
		# 	a Hash?) with the according data.
		#
		def self.handle(words)
			message = "#{self.class} must implement handle method,
					   for more imformation see AbstractService class."
			raise NoMethodError.new message
		end

		# TODO: define a standard procedure for securing the AbtractService interface,
		# extract the NoMethodError exception a more suitable one, like 
		# MethodNotDefinedError.
		# 
    # TODO: define a standard format for the handle response.
	end
end