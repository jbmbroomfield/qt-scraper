class Qt < ActiveRecord::Base

    has_many :posts

    @@base_url = 'https://quicktopic.com/'

    def to_s
        self.title
    end

    def scrape
        if !self.title
            set_title
            get_posts
        end
    end

    def set_title
        self.title = Scraper.get_title(self.url)
        self.save
    end

    def get_posts
        posts = Scraper.get_posts(self.url)
        posts.each do |post|
            user, number, date, time, text, note = post
            Post.create(qt: self, user: user, number: number, date: date, time: time, text: text, note: note)
        end
    end

    def self.create_from_urls(urls)
        urls.each do |url|
            self.create_from_url(url)
        end
    end

    def self.create_from_url(url)
        self.find_or_create_by(url: url.to_s)
    end

    def self.scrape_all
        self.all.each do |qt|
            qt.scrape
        end
    end

end