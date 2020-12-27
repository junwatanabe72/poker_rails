module PaypayScrapesConcern
  require "open-uri"
  require "nokogiri"

  def set_paypay_shops()
    css = "name"
    @shops = []
    (1..9).each { |num|
      url = "https://menta.work/plan?page=#{num}"
      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end

      doc = Nokogiri::HTML.parse(html, nil, charset)

      doc.css(".#{css}").each do |node|
        if node.text.match(/^\n/)
          next
        end
         @shops << node.text
      end
    }
    return @shops = @shops.drop(1)
    # puts @shops
  end

  module_function :set_paypay_shops
end
