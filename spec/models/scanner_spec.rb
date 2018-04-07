require 'rails_helper'

describe 'Scanner' do
  let(:scanner) { Scanner.new('makemehost.com') }
  let(:map) { Map.create(name: 'Roberts Rebellion') }
  let!(:roberts_keyword) { MapKeyword.create(name: 'roberts', map: map) }

  describe '#scan' do
    context 'when there is a keyword positive' do
      it 'returns map name' do
        expect(scanner).to receive(:get_body).and_return(file_fixture("example_body.html").read)
        expect(scanner.scan.first.map.name).to eq('Roberts Rebellion')
      end

      it 'returns player count' do
        expect(scanner).to receive(:get_body).and_return(file_fixture("example_body.html").read)
        expect(scanner.scan.first.player_count).to eq('8/10')
      end

      it 'returns server' do
        expect(scanner).to receive(:get_body).and_return(file_fixture("example_body.html").read)
        expect(scanner.scan.first.server).to eq('Europe')
      end

      it 'returns bot name' do
        expect(scanner).to receive(:get_body).and_return(file_fixture("example_body.html").read)
        expect(scanner.scan.first.bot_name).to eq('34-MakeMeHost')
      end
    end
  end
end