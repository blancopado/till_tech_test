require "json"

class Order

	def initialize(name)
		@name = name
		@basket = []
		@total_amount = 0
		file = File.read('../hipstercoffee.json')
		@data_hash = JSON.parse(file.downcase)
		@prices = @data_hash[0]["prices"][0]
		#p @data_hash
	end

	def add(item, quantity = 1)
		@item = item.downcase
  	@quantity = quantity
  	available ? update_basket : not_update_basket
	end

	def available
		@prices.include?(@item)
	end

	def update_basket
		@basket << { name: @item, quantity: @quantity, 
  	  	        price: @prices[@item],
  	  	        accumulated_prize: accumulated_prize
  	  	        }
	end

	def not_update_basket
		"We don't have it in the menu."
	end

	def accumulated_prize
  	@prices[@item] * @quantity
  end

end