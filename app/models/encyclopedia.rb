class Encyclopedia
  attr_reader :name

  def initialize(name: nil)
    @name = name
  end

  def self.model_name
    ActiveModel::Name.new(self)
  end

  def new_article(*args)
    article_source.call(*args).tap do |a|
      a.encyclopedia = self
    end
  end

  def entries
    ArticleStorageAdapter.fetch_all
  end

  def add_entry(entry)
    ArticleStorageAdapter.add(entry)
  end

  private

  def article_source
    @article_source ||= ArticleStorageAdapter.public_method(:new_article)
  end
end
