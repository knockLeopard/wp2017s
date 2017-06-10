# What is Today's Top News?

## Description
This is a website that you can gather today's top news from
1. 조선일보
2. 경향신문
3. BBC
4. The Korea Times
5. Washington Post
Moreover, you can write down your comment or thinking on each single news.
The top news will be crawled every 3 hours from the moment you turn on server.

### Demo
See [here](https://todaystopnews-knockleopard.c9users.io) for demonstration.

### Features
- __Responsive__ Web Design
- One __comment__ per one news
- __Store__ newspaper contents to the server

### Development Environment
- Ubuntu 16.04.2 LTS server
- ruby 2.3.3p222
- Rails 5.1.1

### Author
- Shim, Sehee (심세희)
- Computer Science and Engineering, SNU
- dgssh@naver.com / https://www.facebook.com/dgssh
- Lecture "Introduction to Web Programming" 2017 Spring, M1313.000200

### Thanks to
- Teacher : withkali

### Install and Usage
- `bundle install`
- `rake db:migrate`
- `rails s` then it runs on localhost:3000

### Database
sqlite3 :: papers:table, url:string, company:string, content:string, comment:text

### Modification
If someone wants to collect more newspaper website, there are two steps
#### 1. At `config/initializers/scheduler.rb`
1. Get the url of the newspaper's top news you want to add
2. Bring the content to string `article`
3. Save all the data related to DB
```ruby
	# Example koreatimes
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
```
#### 2. At `views/layouts/application.html.erb`
1. Add the newspaper's company name to array `ary`
```ruby
 <% ary = ["조선일보", "경향신문", "BBC", "The Korean Times", "Washington Post"] %>
 ```

### How does this website looks like



### What user can expect
- You can track and store top news every 3 hours personally.
- By writing down comment at each single paper, you can save your idea or feeling about the news contents.

### Future Improvement 
- Now the crawler is only set to five newspaper website (Chosun Ilbo, Kyung-hyang shinmun, BBC, The Korea Times, Washington Post). In the future, it might work for every newspaper website.
- For english newspaper, making word-cloud with important keywords so that you can track today's hot topic with short time.

### License

