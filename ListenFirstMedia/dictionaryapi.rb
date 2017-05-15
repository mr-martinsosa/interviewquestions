class Dictionary
  def initialize
    #create 2 hash tables, one for Word/Definitions, another for Synonym/list of Synonyms
    @dictionary = Hash.new {|h,k| h[k] = [] }
    @synonyms = Hash.new {|h,k| h[k] = [] }
  end

  #add a word to the dictionary and it's meaning to the dictionary
  def addWord(word, define)
    #check if it already exists
      if(@dictionary.key?(word))
      puts "{word} is already in the dictionary."
    else
      @dictionary[word] = define
    end
  end
  
  #add a word to the thesaurus and link all synonyms
  def addSynonym(word, synonym)
    #check if it already exists in the dictionary hash
    if(@dictionary.key?(word) && @dictionary.key?(synonym))
        # check if there are duplicates so we do not do anything  
      if @synonyms[word].include?(synonym)
          return
      else 
          synonymNotAdded = true
      end
      #check if arrays need to be initialized
      if !(@synonyms.key?(word))
        @synonyms[word] = []
      end
      
      if !(@synonyms.key?(synonym))
        @synonyms[synonym] = []   
      end
      
      #if word already has synonyms, copy the missing to synonym
      if @synonyms[word].length > 0
        @synonyms[word].each do |x|
          #add words synonym if it's not there
          if !@synonyms[synonym].include?(x)
            @synonyms[synonym].push(x)
          end
          #add new synonym to words synonyms if it's missing
          if !@synonyms[x].include?(synonym)
            @synonyms[x].push(synonym)
          end
        end
      end  
      #if synonym already has synonyms, copy the missing to word
      if @synonyms[synonym].length > 0
        @synonyms[synonym].each do |x|
          #add words synonym if it's not there
          if !@synonyms[word].include?(x)
            @synonyms[word].push(x)
          end
          #add new synonym to words synonyms if it's missing
          if !@synonyms[x].include?(word)
            @synonyms[x].push(word)
          end     
        end
      end  
        #add synonym if it hasn't been added
        if synonymNotAdded
              @synonyms[word].push(synonym)
        end
        if !@synonyms[synonym].include?(word)
            @synonyms[synonym].push(word)
        end
   
    else
      #otherwise break
        puts "One of the words were not found."
    end
  end

  #search for a word in the dictionary returning its definition
  def lookupWord(word)
      if(@dictionary.key?(word))
          puts "#{word}: #{@dictionary[word]}"
    else
      puts "#{word} was not found."
    end
  end
  
  
  #list synonymous words
  def lookupSynonyms(word)
    #check if the word exists
      if(@dictionary.key?(word))
      #if it exists, return all synonyms
      puts "#{word}'s synonyms: "
      @synonyms[word].each {|a| print a, " " }
      puts "\n"
    else
      puts "#{word} was not found."
    end
  end
end
