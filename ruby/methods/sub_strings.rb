def substrings(str, dictionary)
  h = {}
  arr = str.split(' ')
  dictionary.each {|dic|
    arr.each {|word|
      h[dic] = (h[dic] || 0) +1 if (word.downcase).include?(dic)
    }
  }

  h
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings("Howdy partner, sit down! How's it going?", dictionary)
