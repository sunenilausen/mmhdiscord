class Scanner
  def initialize(site)
    @site = site
  end

  def scan
    response = get_body
    page = Nokogiri::HTML(response)
    hits = []
    mmh_rows = page.css('table')[0].css('tr')
    mmh_rows.each do |row|
      maps.each do |map|
        matched_keywords = match_keywords(row.css('td')[3].text, map.keywords)
        hits << create_map_hit(row.css('td'), matched_keywords, map) if matched_keywords.any?
      end
    end
    hits
  end

  def get_body
    RestClient.get('http://makemehost.com/games.php').body
  end

  def maps
    Map.all
  end

  private
    def match_keywords(text, keywords)
      keywords.select{ |keyword| text.downcase.include?(keyword.name.downcase) }
    end

    def create_map_hit(cells, matched_keywords, map)
      MapHit.new(cells[3].text, cells[4].text, cells[0].text, cells[1].text, matched_keywords, map.name)
    end
end