# -*- ruby -*-
#
# SPDX-License-Identifier: Apache-2.0

require "bundler/gem_helper"
require "rake/clean"
require "yard"

task default: :test

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

release_task = Rake.application["release"]
release_task.prerequisites.delete("build")
release_task.prerequisites.delete("release:rubygem_push")
release_task_comment = release_task.comment
if release_task_comment
  release_task.clear_comments
  release_task.comment = release_task_comment.gsub(/ and build.*$/, "")
end

desc "Push built gems"
task "push" do
  require "open-uri"
  helper = Bundler::GemHelper.instance
  gemspec = helper.gemspec
  name = gemspec.name
  version = gemspec.version.to_s
  pkg_dir = "pkg"
  mkdir_p(pkg_dir)
  base_url = "https://github.com/substrait-io/substrait-ruby/releases/download"
  url = URI("#{base_url}/#{version}/#{name}-#{version}.gem")
  path = "#{pkg_dir}/#{File.basename(url.path)}"
  url.open do |input|
    File.open(path, "wb") do |output|
      IO.copy_stream(input, output)
    end
    helper.__send__(:rubygem_push, path)
  end
end

YARD::Rake::YardocTask.new
