describe Remover::Team do
  let(:github_client) { double('Github Client') }
  let(:github_team) { double('Github Team', id: 1, name: 'Owners') }
  let(:team) { Remover::Team.new(github_client, github_team)}

  describe '#name' do
    it 'returns Github team name' do
      expect(team.name).to eq(github_team.name)
    end
  end

  describe '#used' do
    let(:members) { [double('Github Member')] }
    let(:repositories) { [double('Github Repository')] }

    before do
      allow(github_client).to receive(:team_members) { members }
      allow(github_client).to receive(:team_repositories) { repositories }
    end

    context 'with full of members and repositories' do
      it 'not used' do
        expect(team).to be_used
      end
    end

    context 'without members' do
      let(:members) { [] }

      it 'used' do
        expect(team).not_to be_used
      end
    end

    context 'without repositories' do
      let(:repositories) { [] }

      it 'used' do
        expect(team).not_to be_used
      end
    end

    context 'without members and repositories' do
      let(:members) { [] }
      let(:repositories) { [] }

      it 'used' do
        expect(team).not_to be_used
      end
    end
  end
end
