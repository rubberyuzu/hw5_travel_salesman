require 'csv'
		TABLE = CSV.table('input_6.csv')
		ARR= []
		TABLE.each_with_index do |row, i|
		  ARR << {i => {x: row[:x], y:row[:y]}}
		  #creating a nested hash to track each point (naming each)
		end

class Route
	def initialize(arr)
		@total_distance = 0
		@arr = arr
		@copy_arr = arr
		@count = 0
		@start = 0
	end

	def get_two_distance(pt1, pt2)
		to_be_dtc = (pt1[:x]-pt2[:x])**2+(pt1[:y]-pt2[:y])**2
		return Math.sqrt(to_be_dtc)
	end

	def get_best_distance(index)
		pt = @copy_arr[index]
		@arr = @arr - [pt]
		result = {}
		@arr.each_with_index do |p, i|
			result[p.keys[0]] = get_two_distance(pt[index], p.values[0])	
		end
		# result.sort_by{|k,v| v}.first
		result.sort_by{|k,v| v}.first
	end

	def recursion(i)
		if @count == @copy_arr.length-1
			@total_distance += get_two_distance(@copy_arr[i][i], @copy_arr[@start][@start])
			@total_distance
		else
			arr = get_best_distance(i)
			@total_distance += arr[1]
			# p @total_distance
			@count += 1
			if @count == 1
				@start = i
			end
			recursion(arr[0])
		end
	end
end


route = Route.new(ARR)

p route.recursion(0)

