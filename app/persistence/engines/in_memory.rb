module Engines

  class InMemory
    extend Forwardable

    def_delegator :@storage, :size, :count
    def_delegator :@storage, :take, :limit
    def_delegators :@storage, :first, :last, :clear, :take

    def initialize
      @storage = Array.new
    end

    def add object
      object.id = @storage.size + 1
      @storage << object
    end

    def find id
      @storage[id - 1]
    end

    def all
      @storage
    end

    def remove id
      @storage.delete_at(id - 1)
    end
  end

end
