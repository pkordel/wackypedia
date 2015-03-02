class Article
  include ActiveModel::Model
  attr_accessor :id, :title, :body, :pubdate
  attr_writer :encyclopedia

  def encyclopedia
    @encyclopedia ||= THE_ENCYCLOPEDIA
  end

  def publish(clock = DateTime)
    return false unless valid?
    self.pubdate ||= clock.now
    @encyclopedia.add_entry(self)
  end
end
