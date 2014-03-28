describe Remover::Github do
  let(:octokit) { double(Octokit::Client) }
  let(:github) { Remover::Github.new(octokit) }

  describe '#teams' do
    before do
      allow(octokit).to receive(:organization_teams) do
        [double('Github Team')]
      end
    end

    it 'returns array' do
      expect(github.teams).to be_an(Array)
    end

    it 'returns array of Remover::Team' do
      expect(github.teams.first).to be_an(Remover::Team)
    end
  end

  describe '#team_members(github_team_id)' do
    before do
      allow(octokit).to receive(:team_members) { [] }
    end

    it 'returns array' do
      expect(github.team_members(1)).to be_an(Array)
    end
  end

  describe '#team_repositories(github_team_id)'
end
