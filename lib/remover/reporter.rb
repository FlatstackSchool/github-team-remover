require 'colorize'

module Remover
  class Reporter

    attr_accessor :unused_team, :color, :verbose, :delete

    def initialize(unused_team, color, verbose, delete)
      @unused_team, @color, @verbose, @delete = unused_team, color, verbose, delete
    end

    def report_to_cli
      puts "         ------------------------------".colorize(color_it)
      team_name
      members_amount
      members_url
      repos_amount
      repos_url
      report_and_delete
      puts "         ------------------------------".colorize(color_it)
    end

    private

    def team_name
      puts "         Team name: #{unused_team.name}".colorize(color_it)
    end

    def members_amount
      puts "         Members: #{unused_team.members_amount}".colorize(color_it)
    end

    def members_url
      puts "         Members URL:".colorize(color_it)
      puts "         #{unused_team.members_url.colorize(:yellow)}" if verbose?
    end

    def repos_amount
      puts "         Repositories: #{unused_team.repositories_amount}".colorize(color_it)
    end

    def repos_url
       puts "         Repositories URL:".colorize(color)
       puts "         #{unused_team.repositories_url.colorize(:yellow)}" if verbose?
    end

    def report_and_delete
      puts "                   !DELETED!".colorize(:red) if delete
      unused_team.delete_team
    end

    def color_it
      color
    end

  end
end
