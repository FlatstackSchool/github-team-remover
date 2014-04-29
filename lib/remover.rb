require 'bundler/setup'

require 'remover/github'
require 'remover/team'
require 'remover/list'
require 'remover/remove'
require 'remover/cli'
require 'remover/configuration'
require 'remover/formatter'

module Remover
  def self.configuration
    @configuration ||= Configuration.new
  end
end
