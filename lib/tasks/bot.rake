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

  LiveHost.dead_hosts(hits).each do |host|
    host.delete_with_message(bot)
  end
  LiveHost.existing_hosts(hits).each do |host|
    host.edit_with_message(bot)
  end
  LiveHost.new_hits(hits).each do |hit|
    hit.create_and_message(bot)
  end

  bot.run
end