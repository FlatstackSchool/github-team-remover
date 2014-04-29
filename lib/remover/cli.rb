require 'thor'

module Remover
  class CLI < Thor
    method_option :organization, aliases: '--o', required: true
    method_option :login, aliases: '--l', required: true
    method_option :password, aliases: '--p', required: true
    method_option :verbose, aliases: '--v', desc: 'Puts members and repositories links'
    method_option :remove, aliases: '--r', desc: 'Remove unused teams'

    desc('list', 'List unused teams')

    def list
      Remover.configuration.load_from_options!(options)

      Remover::List.new(github).unused_teams.each do |team|
        Remover::Output.new(team, verbose?, remove?).output
      end
    end

    default_task :list

    private

    def verbose?
      options[:verbose]
    end

    def remove?
      options[:remove]
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
