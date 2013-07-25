class StorageAdapter

  class << self
    extend Forwardable

    def instance
      @@instance ||= new
    end
    private :instance

    def instance=(instance)
      @@instance = instance
    end

    def_delegators :instance, :fetch, :fetch_all, :add, :remove, :first, :last, :take
  end

end
