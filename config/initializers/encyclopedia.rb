article_1 = Struct.new(:title, :content).new('Groucho Marx', 'Pretty wacky')
article_2 = Struct.new(:title, :content).new('Harpo Marx', 'Also wacky')
  
THE_ENCYCLOPEDIA = Encyclopedia.new(name: 'Wackypedia', entries: [article_1, article_2])
