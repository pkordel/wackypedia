require_relative '../spec_helper_lite'
require_relative '../../app/persistence/article_repository'
require_relative '../../app/models/article'

describe ArticleRepository do
  let(:first)  { Struct.new(:id, :title, :body).new(nil, 'First', 'World') }
  let(:second) { Struct.new(:id, :title, :body).new(nil, 'Second', 'World') }

  subject do
    ArticleRepository.instance = ArticleRepository.new
    ArticleRepository
  end

  context "when using in memory engine" do
    before do
      subject.clear
      subject.add_article first
    end

    it "adds an article" do
      subject.count.must_equal 1
    end

    it "finds an article" do
      subject.find(1).must_equal first
    end

    it "finds first article" do
      subject.first.must_equal first
    end

    it "finds last article" do
      subject.add_article second
      subject.last.must_equal second
    end

    it "finds all articles" do
      subject.all_articles.must_equal [first]
    end

    it "finds subset of records" do
      subject.add_article second
      subject.limit(1).must_equal [first]
    end

    it "removes an article" do
      subject.add_article second
      subject.delete 1
      subject.all_articles.must_equal [second]
    end

    it "builds a new article object" do
      article = subject.new_article(title: 'Title', body: 'Body')
      article.title.must_equal 'Title'
      article.body.must_equal  'Body'
    end
  end

end
