module Remover
  class Output
    attr_accessor :team

    def initialize (team)
      @team = team
    end

    def output
      puts team.name
      puts "Number of members: #{team.number_of_members}"
      puts "Number of repositories: #{team.number_of_repositories}"
    end
  end
end
