class MapHit
  attr_reader :game_name, :player_count, :bot_name, :server, :keywords, :map

  def initialize(game_name, player_count, bot_name, server, keywords, map)
    @game_name, @player_count, @bot_name, @server, @keywords, @map = game_name, player_count, bot_name, server, keywords, map
  end

  def pretty
    "`#{@bot_name} on #{@server} | #{@game_name} (#{@player_count})`"
  end

  def subscribers
    @map.channels
  end
end