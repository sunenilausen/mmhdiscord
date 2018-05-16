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

  def create_and_message(bot)
    subscribers.each do |subscriber|
      message = bot.send_message(subscriber.key, pretty)
      result = LiveHost.create(map: @map, bot_name: @bot_name, message_id: message.id, channel_id: subscriber.key)
    end
  end
end