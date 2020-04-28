# frozen_string_literal: true

require 'xid'
require 'xid/generator'
require 'xid/error'

module Xid
  class Xid
    include Comparable

    attr_reader :xid

    def initialize(xid = nil, generator: Generator.instance)
      @xid = xid || generator.generate_xid
    end

    def timestamp
      Time.at(
        @xid[0] << 24 | @xid[1] << 16 | @xid[2] << 8 | @xid[3]
      )
    end

    def machine_id
      @xid.slice(4, 3)
    end

    def counter
      @xid[9] << 16 | @xid[10] << 8 | @xid[11]
    end

    def process_id
      @xid[7] << 8 | @xid[8]
    end

    def <=>(other)
      to_s <=> other.to_s
    end

    def to_s
      Base32.encode(to_bytes).downcase.slice(0, ENCODED_LENGTH)
    end

    def to_bytes
      @xid.map(&:chr).join
    end

    def inspect
      "<Xid::Xid '#{self}'>"
    end

    def self.parse(xidstr)
      new(
        Base32.decode(xidstr.to_s.upcase).split('').map(&:ord)
      )
    end
  end
end
