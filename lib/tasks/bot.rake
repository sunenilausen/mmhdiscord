require 'discordrb'

task discord: :environment do
  bot = Discordrb::Bot.new token: ENV['TOKEN'], client_id: ENV['CLIENT_ID']

  bot.message(content: 'Ping!') do |event|
    event.respond 'Pong!'
  end

  scanner = Scanner.new('makemehost.com')

  scheduler = Rufus::Scheduler.new

  scheduler.every ENV['INTERVAL'] do
    hits = scanner.scan
    if hits.any?
      hits.each do |hit|
        hit.subscribers.each do |subscriber|
          bot.send_message(subscriber.key, hit.pretty)
        end
      end
    end
  end

  Maps.dead_hosts(hits).delete_message(bot)
  Maps.existing_hosts(hits).edit_message(bot)
  Maps.new_hosts(hits).send_message(bot)

  bot.run
end