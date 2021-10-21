class Qt < ActiveRecord::Base

    has_many :posts

    @@base_url = 'https://quicktopic.com/'

    def to_s
        self.title
    end

    def self.create_from_urls(urls)
        urls.each do |url|
            self.create_from_url(url)
        end
    end

    def self.create_from_url(url)
        self.find_or_create_by(url: url.to_s)
    end

end