require "relevant/widget"
require "feedzirra"

module Relevant
  class Github
    Version = "0.0.1"
    include Relevant::Widget

    available_options :title => :string, 
                      :rss_feed => :string,
                      :limit => :string

    refresh_every 1.minute
    
    template_format :haml
    template %q[
%h2 Github - #{@options[:title]}
%ul.github-activity
  - activities.each do |activity|
    %li
      %img.avatar{:src => activity.gravatar } 
      = activity.title
:css
  ul.github-activity li { padding-left: 28px; margin-bottom: 0.4em; clear: left }
  ul.github-activity img.avatar { float: left; margin-left: -28px; width: 18px; height: 18px; border: 1px solid #505050; }
]

    Feedzirra::Feed.add_common_feed_entry_element("media:thumbnail", :as => :gravatar, :value => :url)

    def activities
      options[:limit] ? feed.entries.first(options[:limit].to_i) : feed.entries
    end
      
    def feed
      raise ArgumentError, "Github RSS feed is not set" unless options[:rss_feed].present? 
      @feed ||= Feedzirra::Feed.fetch_and_parse(options[:rss_feed])
    end
      
  end
end

Relevant.register Relevant::Github
