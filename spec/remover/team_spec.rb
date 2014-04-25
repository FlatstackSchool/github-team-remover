describe Remover::Team do
  let(:github_client) { double('Github Client', members_amount: 1, repositories_amount: 1, members_url: 'url') }
  let(:github_team) { double('Github Team', id: 1, name: 'Owners') }
  let(:team) { Remover::Team.new(github_client, github_team) }

  describe '#name' do
    it 'returns Github team name' do
      expect(team.name).to eq(github_team.name)
    end
  end

  describe '#members_url' do
    before do
      allow(github_client).to receive(:team_members) { [] }
    end

    it 'returns array' do
      expect(team.members_url).to be_a(String)
    end
  end

  describe '#repositories_url' do
    before do
      allow(github_client).to receive(:team_repositories) { [] }
    end

    it 'returns array' do
      expect(team.repositories_url).to be_a(String)
    end
  end

  describe '#members' do
    before do
      allow(github_client).to receive(:team_members) { [] }
    end

    it 'returns amount of members' do
      expect(team.members_amount).to eq(github_client.team_members(github_team.id).size)
    end
  end

  describe '#repositories_amount' do
    before do
      allow(github_client).to receive(:team_repositories) { [] }
    end

    it 'returns amount of repos' do
      expect(team.repositories_amount).to eq(github_client.team_repositories(github_team.id).size)
    end
  end

  describe '#delete_team' do
    context 'if deleted' do
      before do
        allow(github_client).to receive(:delete_team) { true }
      end

    it 'returns true' do
      expect(team.delete_team).to eq(github_client.delete_team(github_team.id))
    end
  end

    context 'if not deleted' do
      before do
        allow(github_client).to receive(:delete_team) { false }
      end

      it 'returns false' do
        expect(team.delete_team).to eq(github_client.delete_team(github_team.id))
      end
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
