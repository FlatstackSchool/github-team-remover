module Remover
  class Remove
    attr_accessor :team

    def initialize(team)
      @team = team
    end

    def remove
      team.remove
    end
  end
end
