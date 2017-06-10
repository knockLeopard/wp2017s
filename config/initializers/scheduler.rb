require 'rufus-scheduler'
require 'nokogiri'
require 'open-uri'


s = Rufus::Scheduler.singleton

s.every '3h' do

	# chosun
	paper_url = "http://www.chosun.com/"
	paper_data = Nokogiri::HTML(open(paper_url))

	article_page_url = paper_data.css('#top_news').css('h2').css('a')[0]['href']
	article_page_data = Nokogiri::HTML(open(article_page_url))

	article = article_page_data.css('.par').text.strip

	paper = Paper.new
	paper.url = paper_url
	paper.company = "조선일보"
	paper.content = article
	paper.save
	# end of chosun

	# mobile khan
	paper_url = "http://m.khan.co.kr/"
	paper_data = Nokogiri::HTML(open(paper_url))

	article_page_url = paper_data.css('.news_wrap').css('.list_txt').css('a')[0]['href']
	article_page_data = Nokogiri::HTML(open(article_page_url))

	article = article_page_data.css('.txt_news').text.strip.gsub("\r", " ")

	paper = Paper.new
	paper.url = paper_url
	paper.company = "경향신문"
	paper.content = article
	paper.save
	#end of mobile kh

	# BBC
	paper_url = "http://www.bbc.com/"
	paper_data = Nokogiri::HTML(open(paper_url))

	article_page_url = paper_data.css('.media__content').css('a')[0]['href']
	article_page_url = paper_url + article_page_url
	article_page_data = Nokogiri::HTML(open(article_page_url))

	article = ""
    article_page_data.css('.story-body__inner').css('p').each do |temp|
            article = article + " .. " + temp.text
    end

	paper = Paper.new
	paper.url = paper_url
	paper.company = "BBC"
	paper.content = article
	paper.save
	#end of BBC

	# koreatimes
	paper_url = "http://www.koreatimes.co.kr/www/index.asp"
	paper_data = Nokogiri::HTML(open(paper_url))

	article_page_url = paper_data.css('.top1_headline').css('a')[0]['href']
	article_page_url = "http://www.koreatimes.co.kr" + article_page_url
	article_page_data = Nokogiri::HTML(open(article_page_url))

	article = ""
    article_page_data.css('.view_article').css('span').each do |temp|
            article = article + " .. " + temp.text
    end

	paper = Paper.new
	paper.url = paper_url
	paper.company = "The Korean Times"
	paper.content = article
	paper.save
	#end of koreatimes

	# washingtonpost
	paper_url = "https://www.washingtonpost.com/"
	paper_data = Nokogiri::HTML(open(paper_url))

	article_page_url = paper_data.css('#main-content').css('a')[0]['href']
	article_page_data = Nokogiri::HTML(open(article_page_url))

	article = ""
    article_page_data.css('article').css('p').each do |temp|
            article = article + " .. " + temp.text
    end

	paper = Paper.new
	paper.url = paper_url
	paper.company = "Washington Post"
	paper.content = article
	paper.save
	#end of nytimes


end