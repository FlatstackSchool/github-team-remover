require 'octokit'

module Remover
  class Github
    attr_accessor :octokit

    def initialize(octokit)
      @octokit = octokit
    end

    def teams
      github_teams.map do |github_team|
        Remover::Team.new(octokit, github_team)
      end
    end

    def team_members(github_team_id)
      octokit.team_members(github_team_id)
    end

    def team_repositories(github_team_id)
      octokit.team_repositories(github_team_id)
    end

    private

    def github_teams
      octokit.organization_teams(ORGANIZATION)
    end
  end
end
