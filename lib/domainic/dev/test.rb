# frozen_string_literal: true

require 'domainic/dev/test/configuration'
require 'domainic/dev/test/coverage_reporter'

module Domainic
  module Dev
    # Shared testing utilities and configurations for Domainic gems
    #
    # @author {https://aaronmallen.me Aaron Allen}
    # @since 0.2.0
    #
    # @api public
    #
    # @note This module should be required at the beginning of your spec_helper.rb file to ensure proper test
    #   environment setup
    module Test
      # Configure the test environment with optional custom settings
      #
      # @author {https://aaronmallen.me Aaron Allen}
      # @since 0.2.0
      #
      # @api public
      #
      # @see https://relishapp.com/rspec/rspec-core/docs/configuration RSpec configuration documentation
      # @see https://rubydoc.info/github/rspec/rspec-core/RSpec/Core/Configuration RSpec::Core::Configuration
      #
      # @example Customizing the default configuration
      #   Domainic::Spec.configure do |config|
      #     config.before(:suite) { do_something }
      #   end
      #
      # @yield [RSpec::Core::Configuration] the RSpec configuration
      #
      # @return [void]
      # @rbs () ?{ (untyped) -> void } -> void
      def self.configure(&)
        Configuration.default(&)
        @configured = true
      end

      # Ensure the test environment is configured
      #
      # @author {https://aaronmallen.me Aaron Allen}
      # @since 0.2.0
      #
      # @api public
      #
      # @example Basic setup in spec_helper.rb
      #   require 'domainic/spec'
      #
      #   # Configure with defaults
      #   Domainic::Spec.setup
      #
      # @return [void]
      # @rbs () -> void
      def self.setup
        return if @configured

        configure
      end
    end
  end
end
