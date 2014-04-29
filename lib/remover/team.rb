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

    def amt_mem
      github_client.team_members(github_team.id).size
    end

    def amt_rep
      github_client.team_repositories(github_team.id).size
    end

    def out_mem_v
      github_client.team_members(github_team.id)
    end

    def out_rep_v
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
