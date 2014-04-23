require 'thor'
require 'colorize'

module Remover
  class CLI < Thor

    method_option :organization, :aliases => '--o', required: true
    method_option :login, :aliases => '--l', required: true
    method_option :password, :aliases => '--p', required: true
    method_option :color, :aliases => '--c'
    method_option :verbose, :aliases => '--v'

    desc('|Commands:', 'Alias, Command, Meaning.')

    def list
      Remover.configuration.load_from_options!(options)

        puts 'Unused teams:'.colorize(color)

      Remover::List.new(github).unused_teams.each do |unused_team|
        puts "Team name: #{unused_team.name}, Members: #{unused_team.members}, Repositories: #{unused_team.repos}".colorize(color)
      end
    end

    default_task :list

    private

    def color
      Remover.configuration.color.to_sym
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
