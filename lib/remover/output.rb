require 'colorize'

module Remover
  class Output
    attr_accessor :team, :verbose, :remove

    def initialize(team, verbose, remove)
      @team, @verbose, @remove = team, verbose, remove
    end

    def output
      team_name
      number_of_members
      members if verbose
      puts
      number_of_repositories
      repositories if verbose
      puts
      removed_team if remove
      puts
    end

    private

    def team_name
      puts "#{team.name}".colorize(:blue)
    end

    def number_of_members
      puts "    Number of members: #{team.number_of_members}".colorize(:light_blue)
    end

    def number_of_repositories
      puts "    Number of repositories: #{team.number_of_repositories}".colorize(:light_blue)
    end

    def members
      team.members.each do |member|
        puts "     #{member.login}:  #{member.html_url}".colorize(:green)
      end
    end

    def repositories
      team.repositories.each do |repo|
        puts "     #{repo.name}:  #{repo.html_url}".colorize(:green)
      end
    end

    def removed_team
      team.remove
      puts "     #{team.name} removed".colorize(:yellow)
    end
  end
end
