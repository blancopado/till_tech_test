require "json"

class Order

	def initialize(name)
		@name = name
		@basket = []
		@total_amount = 0
		file = File.read('../hipstercoffee.json')
		@data_hash = JSON.parse(file)
		@prices = @data_hash[0]["prices"][0]
		@tax = 8.64
	end

	def add(item, quantity = 1)
		@item = item.split.map(&:capitalize).join(' ')
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

  def total_without_tax
  	helper_var = 0
  	@total_amount = @basket.map { |i| helper_var += i[:accumulated_prize] }.pop
  	@total_amount
  end

  def tax
  	((total_without_tax * @tax ) / 100).round(2)
  end

  def total_with_tax
  	total_without_tax + tax
  end

end
