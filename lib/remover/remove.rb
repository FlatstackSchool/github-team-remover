module Remover
  class Remove
    def remove_and_put_message(team)
      team.delete_team
      puts "          TEAM #{team.name} WAS REMOVED!".red_on_yellow
    end
  end
end
