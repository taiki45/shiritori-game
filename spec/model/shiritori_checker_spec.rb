# -*- coding: utf-8 -*-
require 'spec_helper'

describe Checker::ShiritoriChecker do
  let(:checker) { described_class.new }
  let(:word_a) { Word.new("りんご", "A") }
  let(:word_b) { Word.new("ごりら", "B") }
  let(:word_c) { Word.new("らっぱ", "C") }

  subject { checker.invalid? word_b }

  context "with valid word" do
    before { checker.invalid? word_a }
    it { should be_false }
  end

  context "with invalid word" do
    before { checker.invalid? word_c }
    it { should be_an ShiritoriError }
  end
end
