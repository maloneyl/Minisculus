require 'rspec'
require_relative '../lib/mark_i'

describe MarkI do

  describe '.new' do
    subject { MarkI.new(5) }
    it { should be_instance_of MarkI }
  end

  describe '#encrypt' do
    context 'when given a wheel setting of 5 and an input of "a"' do
      let(:mark_i) { MarkI.new(5) }
      subject(:encrypt_input) { mark_i.encrypt("a") }
      it { should eql("f") }
    end

    context 'when given a wheel setting of 6 and an input of "be"' do
      let(:mark_i) { MarkI.new(6) }
      subject(:encrypt_input) { mark_i.encrypt("be") }
      it { should eql("hk") }
    end
  end

end
