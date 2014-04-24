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
    let(:members_url) {[double('Github Member')]}

    before do
      allow(github_client).to receive(:team_members) {members_url}
    end

    context 'members_url' do
      it 'returns members url' do
        expect(team.members_url).to eq(github_client.members_url)
      end
    end
  end


  describe '#members' do
    let(:members_amount) { [double('Github Member')] }

    before do
      allow(github_client).to receive(:team_members) { members_amount }
    end

    context 'memebers amount' do
      it 'returns amount of members' do
        expect(team.members_amount.size).to eq(github_client.members_amount.size)
      end
    end
  end

  describe '#repositories_amount' do
    let(:repositories_amount) { [double(1)] }

    before do
      allow(github_client).to receive(:team_repositories) { repositories_amount }
    end

    context 'must be equal' do
      it 'returns amount of repos' do
        expect(team.repositories_amount.size).to eq(github_client.repositories_amount.size)
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
