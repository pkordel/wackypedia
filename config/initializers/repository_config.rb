begin
  store                      = Figaro.env.persistence.classify.constantize
  ArticleRepository.instance = ArticleRepository.new(store: store)
rescue
  ArticleRepository.instance = ArticleRepository.new
end
