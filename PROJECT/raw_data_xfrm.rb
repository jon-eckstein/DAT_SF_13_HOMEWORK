

require 'csv'
CSV.open("listens_filtered.csv", "wb") do |csv|
	CSV.foreach("listens.csv") do |row|
		# song,taylor-swift/shake-it-off,4a8af2dc-6b43-4b45-ad26-566f050daab1,2015-04-25T00:02:52.000Z,"",ObjectId(51c1e1452e07b5016a000001)
		should_write = true
		if row[0] != "song"
			should_write = false 
		end
		if row[2].empty? && row[5].empty?
			should_write = false 
		end		
		url_split = row[1].split("/")
		if url_split.count != 2
			should_write = false 
		end	

		if should_write			
			write_row = [row[0], row[1], row[3]] + url_split + [row[5].empty? ? row[2] : row[5].gsub(/ObjectId\(/,"")[0...-1]]
			csv << write_row
		end	  		
  	end  
end

  


