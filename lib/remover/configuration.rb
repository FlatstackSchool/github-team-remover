module Remover
  class Configuration
    OPTIONS = %i(organization login password verbose remove)

    attr_accessor(*OPTIONS)

    def load_from_options!(options)
      OPTIONS.each do |option|
        send("#{option}=", options[option.to_s])
      end
    end

      def verbose?
      true if options[:verbose]
    end

    def remove?
      true if options[:remove]
    end
  end
end
