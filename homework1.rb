#!/usr/bin/ruby

words = IO.read("homework_one_text.txt")
words = words.force_encoding("ISO-8859-1").split(/\s+/)

domain_frequency = Hash.new(0)

words.each do |word|
  if /@/ =~ word
    word =~ /@([a-z|A-Z|\.]+)/
    word = $1
    word.sub!(/\.$/, "")
    domain_frequency[word] += 1
  end
end
domain_frequency = domain_frequency.sort
puts "\nDomain Results\n=============================="
domain_frequency.each do |key, value|
  puts "#{key}: #{value} time(s)".rjust(30)
end
