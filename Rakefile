# -*- ruby -*-
#
# SPDX-License-Identifier: Apache-2.0

require "bundler/gem_helper"
require "rake/clean"
require "yard"

helper = Bundler::GemHelper.new(__dir__)
def helper.version_tag
  version
end

helper.install
spec = helper.gemspec

desc "Generate"
task :generate do
  cd(__dir__) do
    sh("buf",
       "generate",
       "buf.build/substrait/substrait:v#{spec.version}")
  end
end

desc "Run tests"
task :test do
  cd(__dir__) do
    ruby("test/run.rb")
  end
end

YARD::Rake::YardocTask.new

task default: :test
