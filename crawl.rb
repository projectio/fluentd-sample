#!/usr/bin/env ruby

require 'anemone'
require 'pry'

# https://github.com/chriskite/anemone/blob/next/lib/anemone/core.rb
options = {
  threads: 4,
  verbose: false,
  discard_page_bodies: false,
  user_agent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36',
  delay: 3,
  obey_robots_txt: false,
  depth_limit: 2,
  redirect_limit: 5,
  storage: Anemone::Storage.Redis,
  cookies: nil,
  accept_cookies: false,
  skip_query_strings: true,
  proxy_host: nil,
  proxy_port: false,
  read_timeout: 30
}

Anemone.crawl('http://www.yahoo.co.jp/', options) do |anemone|
  # クロールするごとに呼び出される
  # anemone.focus_crawl do |page|
  #   条件に一致するリンクだけ残す
  #   この `links` はanemoneが次にクロールする候補リスト
  #   page.links.keep_if do |link|
  #     link.to_s.match(/detail/)
  #   end
  # end

  anemone.on_pages_like do |page|
  end

  anemone.on_every_page do |page|
    # binding.pry
    title = page.doc.css('title').text rescue nil
    puts "#{title}\t#{page.url.to_s}"
  end

  anemone.after_crawl do |page|
  end
end