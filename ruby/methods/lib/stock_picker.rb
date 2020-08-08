def stock_picker(stock_prices)
	best = [0,0,0]
	stock_prices[0..-2].each_index { |i_buy|
		i_sell = stock_prices.index( stock_prices[i_buy..-1].max )
		profit = stock_prices[i_sell] - stock_prices[i_buy]

		profit > best[-1] ?	best = [i_buy, i_sell, profit] : best
	}
	
	best[0..1]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
# => [1, 4]
p stock_picker([1])
# => [0, 0]
p stock_picker([16,6,94,50,1,100,5,4,36,0])
# => [4, 5]
p stock_picker([15,25,1,100,100,5])
# => [2, 3]