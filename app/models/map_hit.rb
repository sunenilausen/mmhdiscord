class MapHit
  attr_reader :game_name, :player_count, :bot_name, :server, :keywords, :map_name

  def initialize(game_name, player_count, bot_name, server, keywords, map_name)
    @game_name, @player_count, @bot_name, @server, @keywords, @map_name = game_name, player_count, bot_name, server, keywords, map_name
  end

  def pretty
    "Map: #{@map_name}. With game name: #{@game_name}. Containing #{@player_count} players. On bot: #{@bot_name}. On server: #{@server}. Identified by keywords: #{@keywords}"
  end
end