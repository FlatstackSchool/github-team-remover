module Remover
  class Configuration
    OPTIONS = %i(organization login password verbose)

    attr_accessor(*OPTIONS)

    def load_from_options!(options)
      OPTIONS.each do |option|
        send("#{option}=", options[option.to_s])
      end
    end
  end
end
