class StorageAdapter
  class << self
    extend Forwardable
    attr_writer :instance

    def instance
      @instance ||= new
    end
    private :instance

    def_delegators :instance, :fetch, :fetch_all, :add, :remove, :first, :last,
                   :take
  end
end
