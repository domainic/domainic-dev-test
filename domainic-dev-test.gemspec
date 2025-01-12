# frozen_string_literal: true

DOMAINIC_DEV_TEST_GEM_VERSION = '0.0.1'
DOMAINIC_DEV_TEST_SEMVER = '0.0.1'
DOMAINIC_DEV_TEST_REPO_URL = 'https://github.com/domainic/domainic-dev-test'
DOMAINIC_DEV_TEST_HOME_URL = 'https://domainic.org'

Gem::Specification.new do |spec|
  spec.name        = 'domainic-dev-test'
  spec.version     = DOMAINIC_DEV_TEST_GEM_VERSION
  spec.homepage    = DOMAINIC_DEV_TEST_HOME_URL
  spec.authors     = ['Aaron Allen']
  spec.email       = ['hello@aaronmallen.me']
  spec.summary     = 'Shared RSpec and SimpleCov configuration files for Domainic gems'
  spec.description = 'Configuration files, helpers, and shared examples for standardizing test' \
                     'environments across Domainic gems. Provides consistent RSpec setup including' \
                     'custom matchers and formatters, standardized SimpleCov settings with common' \
                     'filters and thresholds, and reusable test helper methods. Ensures testing' \
                     'consistency across the Domainic ecosystem.'
  spec.license     = 'MIT'

  spec.required_ruby_version = '>= 3.1'

  spec.files = Dir.chdir(__dir__) do
    Dir['{lib,sig}/**/*', '.yardopts', 'CHANGELOG.md', 'LICENSE', 'README.md']
      .reject { |f| File.directory?(f) }
  end

  spec.require_paths = ['lib']

  spec.metadata = {
    'bug_tracker_uri' => "#{DOMAINIC_DEV_TEST_REPO_URL}/issues",
    'changelog_uri' => "#{DOMAINIC_DEV_TEST_REPO_URL}/releases/tag/v#{DOMAINIC_DEV_TEST_SEMVER}",
    'homepage_uri' => spec.homepage,
    'rubygems_mfa_required' => 'true',
    'source_code_uri' => "#{DOMAINIC_DEV_TEST_REPO_URL}/tree/v#{DOMAINIC_DEV_TEST_SEMVER}"
  }

  spec.add_dependency 'rspec', '~> 3'
  spec.add_dependency 'simplecov', '~> 0.22'
  spec.add_dependency 'simplecov-lcov', '~> 0.8'
end
