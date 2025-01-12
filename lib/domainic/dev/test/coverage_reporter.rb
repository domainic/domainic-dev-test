# frozen_string_literal: true

require 'simplecov'
require 'simplecov-lcov'

module Domainic
  module Dev
    module Test
      # Test coverage reporting with SimpleCov
      #
      # @author {https://aaronmallen.me Aaron Allen}
      # @since 0.2.0
      #
      # @api public
      #
      # @note This module should be required and initialized in your test helper before any application code is loaded
      # @see https://github.com/simplecov-ruby/simplecov SimpleCov documentation
      # @see https://github.com/fortissimo1997/simplecov-lcov SimpleCov-LCOV documentation
      module CoverageReporter
        class << self
          # Start the coverage reporting process with default configuration
          #
          # @author {https://aaronmallen.me Aaron Allen}
          # @since 0.2.0
          #
          # @api public
          #
          # @example Basic usage
          #   # Start coverage with default settings
          #   Domainic::Spec::CoverageReporter.start
          #
          # @example With custom configuration
          #   Domainic::Spec::CoverageReporter.start do
          #     coverage_dir = 'coverage/my_suite'
          #     minimum_coverage = 95
          #   end
          #
          # @param profile [String, Symbol, nil] the SimpleCov profile to use
          # @yield The SimpleCov::Configuration
          #
          # @return [void]
          # @rbs (?(Symbol | String)? profile) ?{ (?) [self: untyped] -> void } -> void
          def start(profile = nil, &gem_config)
            SimpleCov.start profile do
              enable_coverage :branch # steep:ignore NoMethod
              formatter Domainic::Dev::Test::CoverageReporter.send(:default_formatter) # steep:ignore NoMethod
              add_filter '/spec/' # steep:ignore NoMethod
              configure(&gem_config) if gem_config # steep:ignore NoMethod
            end
          end

          private

          # Configure the default multi-formatter setup
          #
          # @author {https://aaronmallen.me Aaron Allen}
          # @since 0.2.0
          #
          # @api private
          #
          # @return [SimpleCov::Formatter::MultiFormatter] the configured formatter
          # @rbs () -> untyped
          def default_formatter
            SimpleCov::Formatter::MultiFormatter.new( # steep:ignore UnknownConstant
              [
                SimpleCov::Formatter::LcovFormatter, # steep:ignore UnknownConstant
                SimpleCov::Formatter::HTMLFormatter # steep:ignore UnknownConstant
              ]
            )
          end
        end
      end
    end
  end
end
