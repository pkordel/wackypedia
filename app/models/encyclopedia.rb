class Encyclopedia
  attr_reader :name, :entries

  def initialize(name: nil, entries: [])
    @name    = name
    @entries = entries
  end

  def self.model_name
    ActiveModel::Name.new(self)
  end

  def new_article(*args)
    article_source.call(*args).tap do |a|
      a.encyclopedia = self
    end
  end

  private

  def article_source
    @article_source ||= Article.public_method(:new)
  end
end
