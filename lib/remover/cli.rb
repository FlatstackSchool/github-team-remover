require 'thor'

module Remover
  class CLI < Thor
    method_option :organization, required: true
    method_option :login, required: true
    method_option :password, required: true

    desc('list', 'List unused teams')

    def list
      Remover.configuration.load_from_options!(options)

      Remover::List.new(github).unused_teams.each do |team|
        Remover::Output.new(team).output
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
