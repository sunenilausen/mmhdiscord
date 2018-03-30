require 'rails_helper'

describe 'Scanner' do
  let(:scanner) { Scanner.new('makemehost.com') }

  describe '#scan' do
    context 'when there is a keyword positive' do
      it 'returns map name' do
        Map.create(name: 'Roberts Rebellion')
        expect(scanner).to receive(:get_body).and_return(file_fixture("example_body.html").read)
        expect(scanner.scan.first.name).to eq('roberts rebellion')
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