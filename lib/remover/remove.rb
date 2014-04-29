module Remover
  class Remove
    attr_accessor :team

    def initialize(team)
      @team = team
    end

    def remove_and_put_message
      team.delete_team
      puts "          TEAM #{team.name} WAS REMOVED!".red_on_yellow
    end
  end
end
