require 'rubygems'
require 'shen_ruby'

shen = ShenRuby::Shen.new
filename = ""
t1 = Time.now #->stores current time in "t1" variable that was defined earlier

def getfiles(folder) #->This method gets the files, opens them and yields them
	Dir.chdir(folder) #->change directory
	print(Dir.pwd() + "\n") #->prints the new directory
	Dir.glob("*.txt") do |file| #->grabs all files in the current directory and passes them to the next block
		open(file) { |io| yield(io) } #->this block opens the files and yields them
	end
end
counts = Hash.new(0)
getfiles('files') do |file|
	file.read.scan(/\w+/) { |word| counts[word.downcase] += 1 }
	puts(file)
	open("results\\files-word-counts.txt", "w") do |out|
		out << "#{filename}" + "Sorted by word frequency\n" + "{" + counts.sort_by {|_key, value| value}.reverse.map{|k,v| "#{k.inspect}=>#{v.inspect}"}.join(", ") + "}"
		out << "\n\nSorted alphabetically\n" + "{" + counts.sort.map{|k,v| "#{k.inspect}=>#{v.inspect}"}.join(", ") + "}"
	end
end


t2 = Time.now
puts "Finished in " + (t2 - t1).to_s + " seconds"