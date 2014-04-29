require 'colored'

module Remover
  class Formatter
    TEAM_NAME = '    Team Name: %{name}'
    MEMBERS_AMOUNT = '      Members amount: %{mem_am}'
    REPOS_AMOUNT = '      Repositories amount: %{rep_am}'
    REPOS_LIST = '        %{rep_list}'
    MEMBERS_LIST = '        %{mem_list}'
    DELETE_MESSAGE = '        TEAM %{del_name} DELETED!'

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
      (REPOS_AMOUNT % { rep_am: team.repos_amount }).green + "\n"
    end

    def put_members_amount
      (MEMBERS_AMOUNT % { mem_am: team.members_amount }).green + "\n"
    end

    def put_team_name
      (TEAM_NAME % { name: team.name }).red + "\n"
    end

    def put_delete_message
      (DELETE_MESSAGE % { del_name: team.name }).red_on_yellow
    end

    def put_repos_list
      rep_list_str = ''
      team.list_repos.each do |repos|
        rep_list_str += (REPOS_LIST % { rep_list: repos.html_url }).yellow + "\n"
      end
      rep_list_str
    end

    def put_members_list
      mem_list_str = ''
      team.list_members.each do |member|
        mem_list_str += (MEMBERS_LIST % { mem_list: member.html_url }).yellow + "\n"
      end
      mem_list_str
    end
  end
end
