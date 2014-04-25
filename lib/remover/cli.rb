require 'thor'
require 'colored'

module Remover
  class CLI < Thor
    method_option :organization, aliases: '--org', required: true
    method_option :login, aliases: '--log', required: true
    method_option :password, aliases: '--pas', required: true
    method_option :verbose, aliases: '--ver', desc: 'Puts additional info'
    desc('list', 'List unused teams')

    def list
      Remover.configuration.load_from_options!(options)

      Remover::List.new(github).unused_teams.each do |team|
        list_output(team)
      end
    end

    default_task :list

    private

    def list_output(team)
      put_team_name(team)
      put_repos_amount(team)
      put_repos_list(team) if verbose?
      put_members_amount(team)
      put_members_list(team) if verbose?
      puts '    -------------------------'
    end

    def put_repos_amount(team)
      puts "      Repositories amount: #{team.repos_amount}".green
    end

    def put_members_amount(team)
      puts "      Members amount: #{team.members_amount}".green
    end

    def put_team_name(team)
      puts "    Team Name: #{team.name}".red
    end

    def put_repos_list(team)
      team.list_repos.each do |repos|
        puts "        #{repos.html_url}".yellow
      end
    end

    def put_members_list(team)
      team.list_members.each do |member|
        puts "        #{member.html_url}".yellow
      end
    end

    def verbose?
      true if options[:verbose]
    end

    def github
      Remover::Github.new(octokit)
    end

    def octokit
      Octokit::Client.new(
        login: Remover.configuration.login,
        password: Remover.configuration.password
      )
    end
  end
end
