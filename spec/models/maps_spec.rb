require 'rails_helper'

describe 'Map' do
  let(:bfme_map) { Map.create(name: 'Battle For Middle Earth') }
  let(:roberts_map) { Map.create(name: 'Roberts Rebellion') }
  let(:wotj_map) { Map.create(name: 'War of the Jewels') }
  let(:roberts_keyword) { MapKeyword.create(name: 'roberts', map: roberts_map) }
  let(:bfme_keyword) { MapKeyword.create(name: 'bfme', map: bfme_map) }
  let(:wotj_keyword) { MapKeyword.create(name: 'wotj', map: wotj_map) }
  let(:bfme_hit) { MapHit.new('BFME!', "8/10", "mmh-1", "eu", [bfme_keyword], bfme_map) }
  let(:roberts_hit) { MapHit.new('ROBERTS REBELLION', "8/10", "mmh-3", "eu", [roberts_keyword], roberts_map) }
  let(:wotj_hit) { MapHit.new('WOTJ!', "8/10", "mmh-3", "eu", [wotj_keyword], wotj_map) }
  let!(:dead_roberts) { LiveHost.create(map: roberts_map, bot_name: "mmh-2", message_id: "1234", channel_id: "1234") }
  # let(:new_roberts) { LiveHost.new(map: roberts_map, bot_name: "mmh-4", message_id: "1234", channel_id: "1234") }
  let!(:existing_bfme_1) { LiveHost.create(map: bfme_map, bot_name: "mmh-1", message_id: "12", channel_id: "34") }
  let!(:existing_bfme_2) { LiveHost.create(map: bfme_map, bot_name: "mmh-1", message_id: "56", channel_id: "78") }
  # let(:new_wotj) { LiveHost.new(map: wotj_map, bot_name: "mmh-2", message_id: "1234", channel_id: "1234") }
  let(:hits) { [bfme_hit, wotj_hit, roberts_hit] }


  describe '.dead_hosts' do
    it 'returns map is no longer live when given a list of map hits' do
      expect(LiveHost.dead_hosts(hits).first).to eq(dead_roberts)
      expect(LiveHost.dead_hosts(hits).count).to eq(1)
    end
  end

  describe '.existing_hosts' do
    it 'returns map that is already live when given a list of map hits' do
      expect(LiveHost.existing_hosts(hits)).to include(existing_bfme_1)
      expect(LiveHost.existing_hosts(hits)).to include(existing_bfme_2)
      expect(LiveHost.existing_hosts(hits)).not_to include(dead_roberts)
      expect(LiveHost.existing_hosts(hits)).not_to include(new_wotj)
      expect(LiveHost.existing_hosts(hits)).not_to include(new_roberts)
    end
  end

  describe '.new_hosts' do
    it 'returns maps that is not live when given a list of map hits' do
      expect(LiveHost.new_hosts(hits)).to include(roberts_hit)
      expect(LiveHost.new_hosts(hits)).to include(wotj_hit)
      expect(LiveHost.new_hosts(hits)).not_to include(bfme_hit)
    end
  end

  describe '#send_message' do
  end

  describe '#edit_message' do
  end

  describe '#delete_message' do
  end
end