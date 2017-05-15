#!/usr/bin/ruby

#require 'io/console'
require_relative 'dictionaryapi.rb'

#create Dictionary object
aDictionary = Dictionary.new

#ask to load file
puts "Will you load a file? y | n"
choice = gets.chomp

#load file
if choice == 'y'
  puts "Please write the file name, and make sure it is in the same directory!"
  filename = $stdin.gets.chomp
  
  #loop through file, parsing on : and call methods based on what was found on splits
  IO.foreach(filename){|line|
    line = line.chomp
    currentLine = line.split(':')
    if currentLine[0] == "addWord"
      aDictionary.addWord("#{currentLine[1]}", "#{currentLine[2]}")
    end

    if currentLine[0] == "addSynonym"
      aDictionary.addSynonym(currentLine[1], currentLine[2])
    end

    if currentLine[0] == "lookupWord"
      aDictionary.lookupWord(currentLine[1])
    end

    if currentLine[0] == "lookupSynonyms"
      aDictionary.lookupSynonyms(currentLine[1])
    end
  }
end

#continue otherwise
if choice != 'y'
  puts "Loading pre-defined dictionary and thesaurus."
end

#ask to load pre-added dictionary
puts "Will you load the pre-existing dictionary? y | n"
choice = gets.chomp

if choice == 'y'
  #pre-added dictionary
  aDictionary.addWord("Beautiful", "pleasing the senses or mind aesthetically")
  aDictionary.addWord("Gorgeous", "very attractive")
  aDictionary.addWord("Pretty", "attractive in a delicate way")
  aDictionary.addWord("Hot", "lustful, amorous, or erotic")
  aDictionary.addWord("Cute", "attractive in a pretty or endearing way")
  aDictionary.addWord("Adorable", "same as cute")
  aDictionary.addWord("Ruby", "A cool programming language")
  aDictionary.addWord("Cardinal", "A bird")
  aDictionary.addWord("Coral", "Marine invertebrate")
  aDictionary.addWord("Crimson", "A dark color")
  aDictionary.addWord("Rose", "A flower")

  aDictionary.lookupWord("Confused") #test for non-existence
  aDictionary.lookupWord("Beautiful")
  aDictionary.lookupWord("Gorgeous")
  aDictionary.lookupWord("Pretty")
  aDictionary.lookupWord("Hot")
  aDictionary.lookupWord("Cute")
  aDictionary.lookupWord("Adorable")
  aDictionary.lookupWord("Ruby")
  aDictionary.lookupWord("Cardinal")
  aDictionary.lookupWord("Coral")
  aDictionary.lookupWord("Crimson")
  aDictionary.lookupWord("Rose")

  aDictionary.addSynonym("Beautiful", "Gorgeous")
  aDictionary.addSynonym("Beautiful", "Pretty") 
  aDictionary.addSynonym("Beautiful", "Hot")
  aDictionary.addSynonym("Cute", "Beautiful")
  aDictionary.addSynonym("Pretty", "Adorable")
  aDictionary.addSynonym("Pretty", "Confused") #test again for non-existence
  aDictionary.addSynonym("Cardinal", "Ruby")
  aDictionary.addSynonym("Ruby", "Coral")
  aDictionary.addSynonym("Crimson", "Rose")

  aDictionary.lookupSynonyms("Beautiful")
  aDictionary.lookupSynonyms("Gorgeous")
  aDictionary.lookupSynonyms("Pretty")
  aDictionary.lookupSynonyms("Hot")
  aDictionary.lookupSynonyms("Cute")
  aDictionary.lookupSynonyms("Adorable")
  aDictionary.lookupSynonyms("Ruby")
  aDictionary.lookupSynonyms("Cardinal")
  aDictionary.lookupSynonyms("Coral")
  aDictionary.lookupSynonyms("Crimson")
  aDictionary.lookupSynonyms("Rose")
end
