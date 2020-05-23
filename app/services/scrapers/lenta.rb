# frozen_string_literal: true

module Scrapers
  class Lenta
    def call(string)
      sleep(0.5)
      products = []
      encoded_query = CGI.escape(string)
      conn = Faraday.new(
        url: "https://lenta.com/api/v1/search?value=#{encoded_query}",
        headers: {
          'Connection' => 'keep-alive',
          'Cache-Control' => 'max-age=0',
          'Upgrade-Insecure-Requests' => '1',
          'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36',
          'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
          'Sec-Fetch-Site' => 'none',
          'Sec-Fetch-Mode' => 'navigate',
          'Sec-Fetch-User' => '?1',
          'Sec-Fetch-Dest' => 'document',
          'Accept-Language' => 'en-GB,en-US;q=0.9,en;q=0.8',
          'Cookie' => 'ASPXANONYMOUS=7hJjxYY2ZxRboMaOYmfQqs3dCQqdhDdHyZmBNfZg5Q_jHbGmeW-Ewgt9QYx02QdskG02K4yvC_JRgpxrLtKHX1-EzJC7l8RpzoNjbfpf6h4ehZX5XVEQqLuMRAcQaUfv6Mia4g2; ASP.NET_SessionId=52r5ff2zdduqiwe5ja52pui3; CustomerId=0c561944ce674cbeab291f92e24355f7; tmr_lvid=7707477cfe9e1d427756f26e48b7e38e; tmr_lvidTS=1589822047700; _ym_uid=158982204866986434; _ym_d=1589822048; _fbp=fb.1.1589822049356.1893048578; _ga=GA1.2.481196603.1589822049; lentaT2=spb; Store=0006; CityCookie=spb; cookiesession1=6A18CEB249CJPW1OWK3AFHNAQT2VCC95; tmr_reqNum=56'
        }
      )
      response = conn.get
      json = JSON.parse(response.body)
      json['skus'].each do |item|
        products << item
      end

      products.compact.flatten.map do |item|
        price = item.dig('regularPrice', 'value')
        next if price < 0

        image = 'https://lenta.gcdn.co/static/pics/image-default--thumb.305ca150c22262acb4c40de317e93d1a.png'
        image = item['imageUrl'] if !item['imageUrl'].nil? && !item['imageUrl'].empty?

        {
          price: price,
          title: item['title'],
          image: image,
          shop_name: 'lenta'
        }
      end
    end
  end
end
