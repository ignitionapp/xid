require 'base32'

require 'xid/version'
require 'xid/error'
require 'xid/generator'
require 'xid/xid'

module Xid
  RAW_LENGTH = 12
  ENCODED_LENGTH = 20

  def self.generate
    ::Xid::Xid.new
  end
end
