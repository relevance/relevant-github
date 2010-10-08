require 'spec_helper'

describe Relevant::Github do
  describe "options" do
    it "raises ArgumentError if rss feed is not set" do
      lambda {
        Relevant::Github.setup.feed
      }.should raise_error(ArgumentError, "Github RSS feed is not set")
    end

    it "retrieves feed via Feedzilla" do
      Feedzirra::Feed.expects(:fetch_and_parse).with("http://example.com/feed.atom")
      Relevant::Github.setup(:rss_feed => "http://example.com/feed.atom").feed
    end
  end

  describe "limit" do
    context "limit is set" do
      it "only pulls the first _limit_ items" do
        Feedzirra::Feed.stubs(:fetch_and_parse).returns(
          stub('feed', :entries => [stub_everything, stub_everything])
        )
        widget = Relevant::Github.setup(
          :rss_feed => "http://example.com/feed.atom",
          :limit => "1")
        widget.activities.length.should == 1
      end
    end

    context "limit not set" do
      it "passes through all entries" do
        entries = 3.times.inject([]) {|collection| collection << stub_everything }
        Feedzirra::Feed.stubs(:fetch_and_parse).returns(
          stub('feed', :entries => entries)
        )
        widget = Relevant::Github.setup(
          :rss_feed => "http://example.com/feed.atom")
        widget.activities.should == entries
      end
    end

  end
end
