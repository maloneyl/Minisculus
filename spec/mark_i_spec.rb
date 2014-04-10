require 'rspec'
require_relative '../lib/mark_i'

describe MarkI do

  describe '.new' do
    context 'when given a wheel setting between 0 and 9' do
      subject { MarkI.new(5) }
      it { should be_instance_of MarkI }
    end

    context 'when given a wheel setting not within 0 and 9' do
      it 'should raise an ArgumentError' do
        expect { MarkI.new(11) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#encrypt' do
    context 'when given a wheel setting of 5 and an input of "a"' do
      let(:mark_i) { MarkI.new(5) }
      subject(:encrypt_input) { mark_i.encrypt("a") }
      it { should eql("f") }
    end

    context 'when given a wheel setting of 5 and an input of "c"' do
      let(:mark_i) { MarkI.new(5) }
      subject(:encrypt_input) { mark_i.encrypt("c") }
      it { should eql("h") }
    end

    context 'when given a wheel setting of 6 and an input of "be"' do
      let(:mark_i) { MarkI.new(6) }
      subject(:encrypt_input) { mark_i.encrypt("be") }
      it { should eql("hk") }
    end

    context 'when given a wheel setting of 9 and an input of "y"' do
      let(:mark_i) { MarkI.new(9) }
      subject(:encrypt_input) { mark_i.encrypt("y") }
      it { should eql("0") }
    end

    context 'when given a wheel setting of 9 and an input of "hi!"' do
      let(:mark_i) { MarkI.new(9) }
      subject(:encrypt_input) { mark_i.encrypt("hi!") }
      it { should eql("qr5") }
    end

    context 'when given a wheel setting of 6 and an input of "Strong NE Winds!"' do
      let(:mark_i) { MarkI.new(6) }
      subject(:encrypt_input) { mark_i.encrypt("Strong NE Winds!") }
      it { should eql("Yzxutm5TK5cotjy2") }
    end
  end

end
