begin
  storage                        = Figaro.env.persistence.classify.constantize
  ArticleStorageAdapter.instance = storage.new
rescue
  ArticleStorageAdapter.instance = MemoryStorage.new
end
