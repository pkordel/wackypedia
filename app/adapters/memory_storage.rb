class MemoryStorage
  extend Forwardable

  def_delegators :@storage, :first, :last, :clear, :take

  def initialize
    @storage = []
  end

  def fetch(id)
    @storage[id - 1]
  end

  def fetch_all
    @storage
  end

  def add(object)
    object.id = @storage.size + 1
    @storage << object
  end

  def remove(id)
    @storage.delete_at(id - 1)
  end
end
