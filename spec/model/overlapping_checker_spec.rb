require 'spec_helper'

describe WordChecker::OverlappingChecker do
  let(:checker) { described_class.new }
  let(:word_a) { Word.new("abc", "A") }
  let(:word_aa) { Word.new("abcd", "A") }
  let(:word_b) { Word.new("bcd", "B") }

  subject { checker.valid? word_a }

  context "with duplication" do
    before { checker.valid? word_a }
    it { should be_false }
  end

  context "with duplication normal_form" do
    before { checker.valid? word_aa }
    it { should be_false }
  end

  context "with no duplication" do
    before { checker.valid? word_b }
    it { should be_true }
  end
end
