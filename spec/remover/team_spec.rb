describe Remover::Team do
  let(:github_client) { double('Github Client') }
  let(:github_team) { double('Github Team', id: 1) }

  let(:team) { Remover::Team.new(github_client, github_team)}

  context 'without members' do
    before do
      allow(github_client).to receive(:team_members) { [] }
    end

    it 'used' do
      expect(team).not_to be_used
    end
  end

  context 'without repositories' do
    it 'used' do
      expect(team).not_to be_used
    end
  end

  context 'without members and repositories' do
    it 'used' do
      expect(team).not_to be_used
    end
  end

  context 'with full of members and repositories' do
    it 'not used' do
      expect(team).to be_used
    end
  end
end
