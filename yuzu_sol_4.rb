require 'csv'
		TABLE = CSV.table('input_6.csv')
		ARR= []
		TABLE.each do |row|
		  ARR << {x: row[:x], y:row[:y]}
		end


@result = []

class Route
	def initialize(arr)
		@total_distance = 0
		@arr = arr
	end

	def get_two_distance(pt1, pt2)
		to_be_dtc = (pt1[:x]-pt2[:x])**2+(pt1[:y]-pt2[:y])**2
		return Math.sqrt(to_be_dtc)
	end

	def get_route_distance
		for i in 0..@arr.length-1
			if i == @arr.length-1
				@total_distance += get_two_distance(@arr[0], @arr[@arr.length-1])
			else
				@total_distance += get_two_distance(@arr[i], @arr[i+1])
			end	
		end
		@total_distance
	end
end

class Randomizer
	def initialize(arr)
		@arr = []
		for i in 0..arr.length-1
			@arr[i] = arr[i]
		end
	end
	def randomize
		return @arr.shuffle
	end
end

rand_arr = Randomizer.new(ARR).randomize
route = Route.new(rand_arr)
p route.get_route_distance