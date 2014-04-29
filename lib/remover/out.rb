require 'colored'

module Remover
  class Out
    attr_accessor :team, :verbose

    def initialize(team, verbose)
      @team, @verbose = team, verbose
    end

    def team_name
      puts "Team name: #{team.name}".yellow
    end

    def out_members_v
      team.out_mem_v.each do |member|
        puts "| | #{member.html_url}".cyan
      end
    end

    def out_members
      puts "| Members: #{team.amt_mem}".blue
    end

    def out_rep_v
      team.out_rep_v.each do |repos|
        puts "| | #{repos.html_url}".green
      end
    end

    def out_rep
      puts "| Repositories: #{team.amt_rep}".red
    end

    def out_list
      puts '===========* *** *============'
      team_name
      out_members
      out_members_v if verbose
      out_rep
      out_rep_v if verbose
      puts '===========* *** *============'
      puts ''
    end
  end
end
