require 'bundler/setup'

require 'remover/github'
require 'remover/team'
require 'remover/list'
require 'remover/reporter'
require 'remover/cli'
require 'remover/configuration'

module Remover
  def self.configuration
    @configuration ||= Configuration.new
  end
end
