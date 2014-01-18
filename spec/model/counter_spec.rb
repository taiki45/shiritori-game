require 'spec_helper'

describe Counter do
  let(:counter) { described_class.new }
  subject { counter.current }

  context "initialized" do
    it { should eq 0 }
  end

  context "initialized then next" do
    before { counter.next }
    it { should eq 1 }
  end

  context "with 3 elem" do
    before { 2.times do counter.add end }

    context "initialized" do
      it { should eq 0 }
    end

    context "1 time next" do
      before { counter.next }
      it { should eq 1 }
    end

    context "2 times next" do
      before { 2.times do counter.next end }
      it { should eq 3 }
    end

    context "5 times next" do
      before { 5.times do counter.next end }
      it { should eq 5 }
    end
  end
end
