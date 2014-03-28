describe Remover::List do
  let(:github_client) { double('Github Client') }
  let(:list) { Remover::List.new(github_client) }

  let(:used_team) { double('Used Team', used?: true) }
  let(:unused_team) { double('Unused Team', used?: false) }
  let(:teams) { [used_team, unused_team] }

  before do
    allow(github_client).to receive(:teams) { teams }
  end

  describe '#unused_teams' do
    it 'returns array' do
      expect(list.unused_teams).to be_an(Array)
    end

    it 'returns array of unused teams' do
      expect(list.unused_teams).to include(unused_team)
      expect(list.unused_teams).not_to include(used_team)
    end
  end
end
