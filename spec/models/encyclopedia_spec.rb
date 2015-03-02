require_relative '../spec_helper_lite'
require_relative '../../app/models/encyclopedia'
require_relative '../../app/adapters/storage_adapter'
require_relative '../../app/adapters/memory_storage'
require_relative '../../app/adapters/article_storage_adapter'

describe Encyclopedia do
  subject { Encyclopedia.new(name: 'Wacky') }

  before do
    ArticleStorageAdapter.instance = MemoryStorage.new
    ArticleStorageAdapter.clear
  end

  it 'has a name' do
    subject.name.must_equal 'Wacky'
  end

  it 'has an empty list of articles' do
    subject.entries.must_equal []
  end

  it 'adds an entry' do
    entry = Struct.new(:id, :title).new
    subject.add_entry entry
    subject.entries.must_equal [entry]
  end

  describe '.new_article' do
    require 'active_model'
    require_relative '../../app/models/article'

    it 'builds a new article' do
      subject.new_article.must_be_kind_of Article
    end

    it 'sets encyclopedia' do
      article = subject.new_article
      article.encyclopedia.must_equal subject
    end
  end

  describe '#model_name' do
    require 'active_model'
    require_relative '../../config/initializers/inflections'

    it 'knows about model name' do
      subject.class.model_name.singular.must_equal 'encyclopedia'
      subject.class.model_name.plural.must_equal 'encyclopedias'
    end
  end
end
