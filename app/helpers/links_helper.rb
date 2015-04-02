require 'uri'

module LinksHelper

    def prettify_url(url)
        URI.parse(url).host
            .sub('www.', '')
    end

end