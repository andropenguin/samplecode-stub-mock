# -*- coding: utf-8 -*-
require_relative 'entry'

describe Entry do
  context "when using stub" do
    before(:each) do
      @entry = double('Entry')
      allow(@entry).to receive(:text).and_return('stubbed')
    end
    it "stubbed" do
      expect(@entry.text).to eq 'stubbed'
    end
  end

  context "when making a stub object" do
    before(:each) do
      @entry = double('entry')
      allow(@entry).to receive(:text).and_return('stubbed')
    end
    it "stubbed" do
      expect(@entry.text).to eq 'stubbed'
      expect(@entry).not_to be_an_instance_of(Entry)
    end
  end

  describe "when returning Null Object" do
    before(:each) do
      @entry = double('entry').as_null_object
      allow(@entry).to receive(:text).and_return('stubbed')
    end
    it "return Null Object" do
      expect(@entry.text).to eq 'stubbed'
      expect(@entry.bar).not_to raise_error
    end
  end

  describe "when chaining a stub" do
    before (:each) do
      @e = double('Entry')
      Entry.stub_chain(:active, :recent, :commented) { [@e] }
    end
    it "chain a stub" do
      expect(Entry.active.recent.commented.first).to eq @e
    end
  end

  describe "when text method called" do
    before(:each) do
      @entry = double('Entry')
      expect(@entry).to receive(:text).and_return('stubbed')
    end
    it "text method called" do
      expect(@entry.text).to eq 'stubbed'
    end
  end

# This test is wrong.
  describe "when text method not called" do
    before(:each) do
      @entry = double('Entry')
      expect(@entry).to receive(:text).and_return('stubbed')
    end
  end
end
