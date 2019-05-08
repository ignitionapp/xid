require 'digest'
require 'socket'
require 'singleton'

module Xid
  class Generator
    include Singleton

    ENCODING = '0123456789abcdefghijklmnopqrstuv'.freeze
    RAW_LENGTH = 12
    ENCODED_LENGTH = 20

    def initialize
      @rand_id = rand(0x10000)
      @semaphore = Mutex.new
    end

    def generate_xid
      now = current_time
      mid = machine_id
      pid = process_id
      counter = next_id

      bytes     = Array.new(RAW_LENGTH, 0)
      bytes[0]  = (now >> 24) & 0xff
      bytes[1]  = (now >> 16) & 0xff
      bytes[2]  = (now >> 8) & 0xff
      bytes[3]  = now & 0xff
      bytes[4]  = mid[0]
      bytes[5]  = mid[1]
      bytes[6]  = mid[2]
      bytes[7]  = ((pid >> 8) % 256)
      bytes[8]  = (pid % 128)
      bytes[9]  = (counter >> 16) & 0xff
      bytes[10] = (counter >> 8) & 0xff
      bytes[11] = counter & 0xff
      bytes
    end

    def next_id
      @semaphore.synchronize { @rand_id += 1 }
    end

    def machine_id
      hash = Digest::MD5.digest(Socket.gethostname)
      hash.slice(0, 3).split('').map(&:ord)
    end

    def process_id
      Process.pid
    end

    def current_time
      Time.now.to_i
    end
  end
end
