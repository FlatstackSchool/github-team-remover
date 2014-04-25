module Remover
  class Team
    attr_accessor :github_client, :github_team

    def initialize(github_client, github_team)
      @github_client, @github_team = github_client, github_team
    end

    def used?
      with_members? && with_repositories?
    end

    def name
      github_team.name
    end

    def delete_team
      github_client.delete_team(github_team.id)
    end

    def members_amount
      github_client.team_members(github_team.id).size
    end

    def repos_amount
      github_client.team_repositories(github_team.id).size
    end

    def list_members
      github_client.team_members(github_team.id)
    end

    def list_repos
      github_client.team_repositories(github_team.id)
    end

    private

    def with_members?
      github_client.team_members(github_team.id).size > 0
    end

    def with_repositories?
      github_client.team_repositories(github_team.id).size > 0
    end
  end
end
