require 'colored'

module Remover
  class Formatter
    TEAM_NAME = "    Team Name: %{count}"
    MEMBERS_AMOUNT = "      Members amount: %{count}"
    REPOS_AMOUNT = "      Repositories amount: %{count}"
    REPOS_LIST = "        %{count}"
    MEMBERS_LIST = "        %{count}"


    attr_accessor :team

    def initialize(team)
      @team = team
    end

    def list_output
      "#{put_team_name}
      #{put_repos_amount}
      #{put_repos_list}
      #{put_members_amount}
       #{put_members_list}"
    end

    private

    def put_repos_amount
        (REPOS_AMOUNT % {count: team.repos_amount}).green
    end

    def put_members_amount
      (MEMBERS_AMOUNT % {count: team.members_amount}).green
    end

    def put_team_name
      (TEAM_NAME % {count: team.name}).red
    end

    def put_repos_list
      team.list_repos.each do |repos|
        (REPOS_LIST % {count: repos.html_url}).yellow
      end
    end

    def put_members_list
      team.list_members.each do |member|
        (MEMBERS_LIST % {count: member.html_url}).yellow
      end
    end
  end
end
