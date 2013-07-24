class ArticleRepository
  attr_reader :engine

  class << self
    extend Forwardable

    def instance
      @@instance ||= new
    end
    private :instance

    def instance=(instance)
      @instance = instance
    end

    def_delegators 'instance.engine', :find, :count, :clear, :first, :last, :limit
    def_delegators :instance, :all_articles, :add_article, :new_article
    def_delegator  'instance.engine', :remove,  :delete
    def_delegator  'instance.engine', :take,    :limit
  end

  def initialize(engine: Store::InMemory)
    @engine = engine.new
  end

  def all_articles
    @engine.all
  end

  def add_article article
    @engine.add article
  end

  def new_article(*args)
    Article.new(*args)
  end

end
