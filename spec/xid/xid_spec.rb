# frozen_string_literal: true

module Xid
  RSpec.describe Xid do
    let!(:xids) { 10_000.times.map { described_class.new } }

    it 'is unique' do
      expect(xids.length).to eq(xids.uniq.length)
    end

    it 'is sortable' do
      xids.each_slice(2).each do |first, second|
        expect(first < second)
      end
    end
  end
end
