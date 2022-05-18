# -*- ruby -*-
#
# SPDX-License-Identifier: Apache-2.0

require_relative "lib/substrait/version"

Gem::Specification.new do |spec|
  spec.name = "substrait"
  spec.version = Substrait::VERSION
  spec.homepage = "https://substrait.io/"
  spec.authors = ["Sutou Kouhei"]
  spec.email = ["kou@clear-code.com"]

  spec.summary = "The Ruby bindings or Substrait"
  spec.description =
    "Substrait is cross-language serialization for Relational Algebra. " +
    "You can use Substrait in Ruby with this gem."
  spec.license = "Apache-2.0"
  spec.files = [
    "#{spec.name}.gemspec",
    "CHANGELOG.md",
    "Gemfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    *Dir.glob("lib/**/*.rb"),
  ]

  spec.add_runtime_dependency("google-protobuf")

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/substrait/substrait-ruby/issues",
    "changelog_uri" => "https://github.com/substrait/substrait-ruby/blob/#{spec.version}/doc/text/news.md",
    "source_code_uri" => "https://github.com/substrait/substrait-ruby",
  }
end
