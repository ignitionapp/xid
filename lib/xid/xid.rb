require 'xid/generator'
require 'xid/error'

module Xid
  class Xid
    include Comparable

    def initialize(xid = nil, generator: Generator.instance)
      @xid = xid || generator.generate_xid
    end

    def <=>(other)
      to_s <=> other.to_s
    end

    def inspect
      "<Xid::Xid #{self}>"
    end

    def to_s
      Base32.encode(bytes).downcase.slice(0, 20)
    end

    def bytes
      @xid.map(&:chr).join
    end
  end
end
