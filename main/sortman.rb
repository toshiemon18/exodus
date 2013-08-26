class Random

	def make_rand(num)
		arr = Array.new(num){|i| i}

		for i in 0..arr.size-1 do
			arr[i] = "#{arr[i]},#[rand]"
		end

		arr.sort!{|p,q| p.split(',')[1] <=> q.split(',')[1]}

		for i in 0..arr.size-1 do
			n = arr[i].split(',')
			arr[i] = n= n[0].to_i
		end
	return arr
	end
end
