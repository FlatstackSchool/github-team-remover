require 'colored'

module Remover
  class Output
    attr_accessor :team, :verbose, :remove

    def initialize(team, verbose, remove)
      @team, @verbose, @remove = team, verbose, remove
    end

    def list_output
      put_team_name
      put_repos_amount
      put_repos_list if verbose
      put_members_amount
      put_members_list if verbose
      Remover::Remove.new.remove_and_put_message if remove
      puts '    -------------------------'
    end

    private

    def put_repos_amount
      puts "      Repositories amount: #{team.repos_amount}".green
    end

    def put_members_amount
      puts "      Members amount: #{team.members_amount}".green
    end

    def put_team_name
      puts "    Team Name: #{team.name}".red
    end

    def put_repos_list
      team.list_repos.each do |repos|
        puts "        #{repos.html_url}".yellow
      end
    end

    def put_members_list
      team.list_members.each do |member|
        puts "        #{member.html_url}".yellow
      end
    end
  end
end
