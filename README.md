# What is Today's Top News?

## Description
This is a website that you can gather today's top news from
1. Chosun Ilbo
2. Kyung-hyang shinmun
3. BBC
4. The Korea Times
5. Washington Post

Moreover, you can write down your comment or thinking on each single news.
The top news will be crawled every 3 hours from the moment you turn on server.

### Demo
See [here](https://todaystopnews-knockleopard.c9users.io) for demonstration.

### Features
- Responsive Web Design
- One comment per one news
- Store newspaper contents to the server

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

### What user can expect
- You can track and store top news every 3 hours personally.
- By writing down comment at each single paper, you can save your idea or feeling about the news contents.

### Future Improvement 
- Now the crawler is only set to five newspaper website (Chosun Ilbo, Kyung-hyang shinmun, BBC, The Korea Times, Washington Post). In the future, it might work for every newspaper website.
- For english newspaper, making word-cloud with important keywords so that you can track today's hot topic with short time.

### License

