require File.expand_path('../config/environment', __FILE__)
require 'rake'
require 'rake/testtask'
require 'pry'
Dir[File.expand_path(File.join('../lib/tasks/**/*.rake'), __FILE__)].each {|file| import file }

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs.push 'spec'
end

