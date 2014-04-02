module Remover
  class Configuration
    OPTIONS = %i(organization username password)

    attr_accessor *OPTIONS

    def load_from_options!(options)
      OPTIONS.each do |option|
        send("#{option}=", options[option.to_s])
      end
    end
  end
end
