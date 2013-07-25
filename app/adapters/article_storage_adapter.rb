class ArticleStorageAdapter < StorageAdapter

  class << self
    def new_article(*args)
      Article.new(*args)
    end
    def_delegators :instance, :clear
  end

end
