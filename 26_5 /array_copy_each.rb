def array_copy(source)
destination=[]
source.each do |i|
	destination << i if i<4
end
return destination
end 
