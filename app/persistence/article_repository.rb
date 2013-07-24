class ArticleRepository
  attr_reader :store

  class << self
    extend Forwardable

    def instance
      @@instance ||= new
    end
    private :instance

    def instance=(instance)
      @instance = instance
    end

    def_delegators 'instance.store', :find, :count, :clear, :first, :last, :limit
    def_delegators :instance, :all_articles, :add_article, :new_article
    def_delegator  'instance.store', :remove,  :delete
    def_delegator  'instance.store', :take,    :limit
  end

  def initialize(store: Store::InMemory)
    @store = store.new
  end

  def all_articles
    @store.all
  end

  def add_article article
    @store.add article
  end

  def new_article(*args)
    Article.new(*args)
  end

end
