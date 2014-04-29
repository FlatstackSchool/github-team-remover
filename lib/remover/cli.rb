require 'thor'
require 'colored'

module Remover
  class CLI < Thor
    method_option :organization, aliases: '--org', required: true
    method_option :login, aliases: '--log', required: true
    method_option :password, aliases: '--pas', required: true
    method_option :remove, aliases: '--rem', desc: 'Removes unused teams'
    desc('list', 'List unused teams')

    def list
      Remover.configuration.load_from_options!(options)
      Remover::List.new(github).unused_teams.each do |team|
        puts Remover::Formatter.new(team).list_output
        if options[:remove]
          team.delete_team
          puts "    #{team.name} DELETED!!!".red_on_yellow
        end
      end
    end

    default_task :list

    private

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
