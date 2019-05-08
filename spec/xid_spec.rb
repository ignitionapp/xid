require 'pry'

RSpec.describe Xid do
  it 'has a version number' do
    expect(Xid::VERSION).not_to be nil
  end

  describe '.generate' do
    subject { described_class.generate }

    it 'returns an Xid' do
      expect(subject.class).to eq(Xid::Xid)
    end
  end
end
