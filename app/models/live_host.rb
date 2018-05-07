class LiveHost < ApplicationRecord
  belongs_to :map

  validates :message_id, presence: true
  validates :channel_id, presence: true
  validates :bot_name, presence: true

  def self.dead_hosts hits
    all.reject{ |host| host.exists_in(hits) }
  end

  def self.existing_hosts hits
    all.select{ |host| host.exists_in(hits) }
  end

  def self.new_hosts hits
    # hosts_from(hits: hits) - existing_hosts(hits) - dead_hosts(hits)
  end

  def self.hosts_from hits:
    hits.map(&:map).map(&:live_hosts).flatten
  end

  def exists_in hits
    hits.select { |hit| map == hit.map && bot_name == hit.bot_name }.any?
  end
end
