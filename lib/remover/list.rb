module Remover
  class List
    attr_accessor :github_client

    def initialize(github_client)
      @github_client = github_client
    end

    def unused_teams
      teams.delete_if(&:used?)
    end

    private

    def teams
      github_client.teams
    end
  end
end
