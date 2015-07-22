require "vagrant-rebuild/version"

module Rebuild
  class Rebuild < Vagrant.plugin("2")
    name "vagrant-rebuild"
    description "stops and deletes all traces of the vagrant machine then starts and provisions the vagrant environment"

    command "rebuild" do
      #require_relative "vagrant-rebuild"
      require File.expand_path("../command", __FILE__)
      Command
    end
  end
end
