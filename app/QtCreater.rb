class QtCreater

    @@base_url = 'https://quicktopic.com/'

    def self.create(input_text)
        self.urls(input_text).each do |url|
            self.create_from_url(url)
        end
    end

    def self.urls(input_text)
        urls = input_text.split('<a href="' + @@base_url)
        urls.shift
        puts "------------------"
        puts urls
        puts "------------------"
        urls.map { |url| @@base_url + url.split('"')[0] }
    end

    def self.create_from_url(url)
        Qt.find_or_create_by(url: url)
    end

end