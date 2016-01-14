require "json"

class Order

	def initialize(name)
		@name = name
		@basket = []
		@total_amount = 0
		file = File.read('../hipstercoffee.json')
		data_hash = JSON.parse(file)
		#p data_hash
		#p data_hash[0]["address"]
	end

	def add

	end

end

order = Order.new "pablo"