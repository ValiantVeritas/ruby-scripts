require 'rubygems'
require 'nokogiri'
require 'open-uri'

def getText(doc)
	heading = ""
	doc.css('h1.firstHeading > span').each {|head| heading = head.content} #->This block stores the title of the page in a variable
	
	doc.css('p').each do |text| 
		open("#{heading}" + ".txt", "a") do |out| #->This block takes the content of each paragraph element in the webpage passed to it and copies it into a file
			out << "#{text.content}"
		end
	end
	puts(heading + '.txt is finished')
end
t1 = Time.now
Dir.chdir('files')
sites = ['http://www.en.wikipedia.org/wiki/philosophy', 'http://www.en.wikipedia.org/wiki/math', 'http://www.en.wikipedia.org/wiki/Science','http://www.en.wikipedia.org/wiki/cellular_automaton', 'http://www.en.wikipedia.org/wiki/topology', 'http://www.en.wikipedia.org/wiki/category_theory']
sites.each do |site|
	getText(Nokogiri::HTML(open(site)))
end
t2 = Time.now
puts "Finished in " + (t2 - t1).to_s + " seconds"


