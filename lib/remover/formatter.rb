require 'colored'

module Remover
  class Formatter
    TEAM_NAME = '    Team Name: %{count}'
    MEMBERS_AMOUNT = '      Members amount: %{count}"'
    REPOS_AMOUNT = '      Repositories amount: %{count}'
    REPOS_LIST = '        %{count}"'
    MEMBERS_LIST = '        %{count}'
    DELETE_MESSAGE = '        TEAM %{count} DELETED!'

    attr_accessor :team

    def initialize(team)
      @team = team
    end

    def list_output
      put_team_name +
      put_repos_amount +
      put_repos_list +
      put_members_amount +
      put_members_list
    end

    private

    def put_repos_amount
      (REPOS_AMOUNT % { count: team.repos_amount }).green + "\n"
    end

    def put_members_amount
      (MEMBERS_AMOUNT % { count: team.members_amount }).green + "\n"
    end

    def put_team_name
      (TEAM_NAME % { count: team.name }).red + "\n"
    end

    def put_delete_message
      (DELETE_MESSAGE % { count: team.name }).red_on_yellow
    end

    def put_repos_list
      rep_list_str = ''
      team.list_repos.each do |repos|
        rep_list_str += (REPOS_LIST % { count: repos.html_url }).yellow + "\n"
      end
      rep_list_str
    end

    def put_members_list
      mem_list_str = ''
      team.list_members.each do |member|
        mem_list_str += (MEMBERS_LIST % { count: member.html_url }).yellow + "\n"
      end
      mem_list_str
    end
  end
end
