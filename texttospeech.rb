require 'tts'
Dir.chdir('wordcount\files')
Dir.glob("*.txt") do |file| 
	open(file, "r") { |io| io.read.to_file "en" }
end