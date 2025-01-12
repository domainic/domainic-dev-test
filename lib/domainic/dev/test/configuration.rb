# frozen_string_literal: true

module Domainic
  module Dev
    module Test
      # Domainic RSpec configuration
      #
      # @author {https://aaronmallen.me Aaron Allen}
      # @since 0.2.0
      #
      # @api private
      #
      # @note This module should be required and initialized in your test helper before your test suite runs
      # @see https://relishapp.com/rspec/rspec-core/docs/configuration RSpec configuration documentation
      # @see https://rubydoc.info/github/rspec/rspec-core/RSpec/Core/Configuration RSpec::Core::Configuration
      module Configuration
        # Configure RSpec with Domainic's default settings
        #
        # @author {https://aaronmallen.me Aaron Allen}
        # @since 0.2.0
        #
        # @api private
        #
        # @yield [RSpec::Core::Configuration] the RSpec configuration
        #
        # @return [void]
        # @rbs () ?{ (untyped) -> void } -> void
        def self.default(&block)
          RSpec.configure do |config| # steep:ignore UnknownConstant
            config.example_status_persistence_file_path = '.rspec_status'
            config.disable_monkey_patching!
            config.expect_with(:rspec) { |c| c.syntax = :expect }
            config.order = :random
            Kernel.srand config.seed
            yield(config) if block
          end
        end
      end
    end
  end
end
