require 'base32'

require 'xid/version'
require 'xid/error'
require 'xid/generator'
require 'xid/xid'

module Xid
  def self.generate
    ::Xid::Xid.new
  end
end
