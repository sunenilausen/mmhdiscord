class MapHit
  attr_reader :game_name, :player_count, :bot_name, :server, :keywords, :map

  def initialize(game_name, player_count, bot_name, server, keywords, map)
    @game_name, @player_count, @bot_name, @server, @keywords, @map = game_name, player_count, bot_name, server, keywords, map
  end

  def pretty
    "Map: #{@map.name}. With game name: #{@game_name}. Containing #{@player_count} players. On bot: #{@bot_name}. On server: #{@server}. Identified by keywords: #{@keywords.map(&:name).join(', ')}"
  end

  def subscribers
    @map.channels
  end
end