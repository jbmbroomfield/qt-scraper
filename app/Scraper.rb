require 'nokogiri'
require 'open-uri'

class Scraper

    def self.show_post(post)
        user = post.css('.messageauthor')
        user &&= user.text
        number = post.css('.messagenumber')
        number &&= number.text
        datetime = post.css('.messagedata')
        date = datetime && datetime[0] && datetime[0].text
        time = datetime && datetime[1] && datetime[1].text        
        text = post.css('.messagecell')
        text.search('.div-topic-message-edited-note').remove
        divs = text.css('div')
        if divs.length > 0
            text = divs[0]
        end
        text = text.inner_html
        puts [
            "-----",
            "User: #{user}",
            "Number: #{number}",
            "Date: #{date}",
            "Time: #{time}",
            "Text: #{text}",
            "-----",
        ]
    end

    def self.get_posts(url)
        page = 1
        posts = []
        loop do
            posts += self.get_page(url, page).css('.messagerow')
            posts.length == page * 1000 ? page += 1 : break
        end
        posts
    end

    def self.get_page(url, page=1)
        url = url + "/p#{page}000.#{page - 1}001"
        Nokogiri::HTML(open(url))
    end

end