require 'rails_helper'

describe 'LiveHost' do
  let(:roberts_map) { Map.create(name: 'Roberts Rebellion') }
  let(:roberts_keyword) { MapKeyword.create(name: 'roberts', map: roberts_map) }
  let(:roberts_hit) { MapHit.new('ROBERTS REBELLION', "8/10", "mmh-3", "eu", [roberts_keyword], roberts_map) }
  let!(:roberts_channel) { Channel.create(maps: [roberts_map], key: "1234")}

  describe '#create_host' do
    it 'creates a new host and sends message' do
      bot = double
      expect(bot).to receive(:send_message).with("1234", roberts_hit.pretty).and_return('5678')
      roberts_hit.create_host(bot)

      expect(LiveHost.last).to be_present
    end
  end
end