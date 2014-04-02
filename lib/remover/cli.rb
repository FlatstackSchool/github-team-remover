require 'thor'

module Remover
  class CLI < Thor
    method_option :organization, required: true
    method_option :username, required: true
    method_option :password, required: true

    desc('list', 'List unused teams')

    def list
      Remover::List.new(github).unused_teams.each do |team|
        puts team.name
      end
    end

    default_task :list

    private

    def github
      Remover::Github.new(octokit)
    end

    def octokit
      Octokit::Client.new(
        login: options[''],
        password: Remover::PASSWORD
      )
    end
  end
end
