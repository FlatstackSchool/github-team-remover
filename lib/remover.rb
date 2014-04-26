require 'bundler/setup'

require 'remover/github'
require 'remover/team'
require 'remover/list'
require 'remover/cli'
require 'remover/configuration'
require 'remover/output'
require 'remover/remove'

module Remover
  def self.configuration
    @configuration ||= Configuration.new
  end
end
