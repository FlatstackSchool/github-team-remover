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
      if verbose?
        Remover::List.new(github).unused_teams.each do |unused_team|
           puts "
          Team name: #{unused_team.name},
          Members: #{unused_team.members_amount},
          Members URL: #{unused_team.members_url},
          Repositories: #{unused_team.repositories_amount},
          Repositories URL: #{unused_team.repositories_url}
          ".colorize(color)
        end
      else
        Remover::List.new(github).unused_teams.each do |unused_team|
          puts "
          Team name: #{unused_team.name},
          Members: #{unused_team.members_amount},
          Repositories: #{unused_team.repositories_amount}".colorize(color)
        end
      end
    end

    default_task :list

    private

    def verbose?
      if ! options[:verbose].eql? nil
        true
      else
        false
      end
    end

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
