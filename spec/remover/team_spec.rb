describe Remover::Team do
  let(:github_client) { double('Github Client') }
  let(:github_team) { double('Github Team', id: 1, name: 'Owners') }
  let(:team) { Remover::Team.new(github_client, github_team) }

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

  describe '#amt_rep' do
    before do
      allow(github_client).to receive(:team_repositories) { [] }
    end

    it 'returns repository amount' do
      expect(team.amt_rep).to eq(github_client.team_repositories(github_team.id).size)
    end
  end

  describe '#out_rep_v' do
    before do
      allow(github_client).to receive(:team_repositories) { [] }
    end

    it 'returns array (info about repositories)' do
      expect(team.out_rep_v).to be_an(Array)
    end
  end

  describe '#amt_mem' do
    before do
      allow(github_client).to receive(:team_members) { [] }
    end

    it 'returns members amount' do
      expect(team.amt_mem).to eq(github_client.team_members(github_team.id).size)
    end
  end

  describe '#out_mem_v' do
    before do
      allow(github_client).to receive(:team_members) { [] }
    end

    it 'returns array (info about members)' do
      expect(team.out_mem_v).to be_an(Array)
    end
  end
end
