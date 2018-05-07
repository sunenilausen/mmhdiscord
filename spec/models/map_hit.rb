require 'rails_helper'

describe 'LiveHost' do
  let(:roberts_map) { Map.create(name: 'Roberts Rebellion') }
  let(:roberts_keyword) { MapKeyword.create(name: 'roberts', map: roberts_map) }
  let(:roberts_hit) { MapHit.new('ROBERTS REBELLION', "8/10", "mmh-3", "eu", [roberts_keyword], roberts_map) }
  let(:hits) { [roberts_hit] }

  describe '#create_with_message' do
    
  end
end