class LiveHost < ApplicationRecord
  belongs_to :map

  validates :message_id, presence: true
  validates :channel_id, presence: true
  validates :bot_name, presence: true

  def self.dead_hosts hits
    all.reject{ |host| host.same_as(hits).any? }
  end

  def self.existing_hosts hits
    all.select{ |host| host.same_as(hits).any? }
  end

  def self.new_hits hits
    hits.reject{ |hit| all.where(map_id: hit.map.id).where(bot_name: hit.bot_name).any? }
  end

  def same_as hits
    hits.select { |hit| map == hit.map && bot_name == hit.bot_name }
  end

  def edit_message(bot, hits)
    content = same_as(hits).first.pretty
    channel = bot.channel(channel_id)
    message = channel.load_message(message_id)
    message.edit(content)
  end

  def delete_message(bot)
    bot.channel(channel_id).load_message(message_id).delete
  end
end
