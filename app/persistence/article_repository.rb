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

    def_delegators 'instance.engine', :add, :find, :count, :clear, :first, :last, :limit
    def_delegator  'instance.engine', :all, :all_articles
    def_delegator  'instance.engine', :remove, :delete
    def_delegator  'instance.engine', :take, :limit
  end

  def initialize(engine: Store::InMemory)
    @engine = engine.new
  end

end
