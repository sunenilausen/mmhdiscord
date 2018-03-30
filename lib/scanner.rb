class Scanner

  MapHit = Struct.new(:name, :player_count, :bot_name, :server)

  def initialize(site)
    @site = site
  end

  def scan
    response = get_body
    page = Nokogiri::HTML(response)
    mmh_rows = page.css('#mmh table tbody')

    hits = []
    mmh_rows.css('tr').each do |row|
      if row.css('td')[3].text == 'roberts rebellion'
        hit = MapHit.new(row.css('td')[3].text, row.css('td')[4].text, row.css('td')[0].text, row.css('td')[1].text)
        hits << hit
      end
    end
    hits
  end

  def get_body
    HTTParty.get('http://makemehost.com/games.php').body
  end

  def report
  end
end