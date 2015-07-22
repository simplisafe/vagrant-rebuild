require 'vagrant'

module Rebuild
  class Command < Vagrant.plugin("2", :command)
    include Vagrant::Util::SafePuts

    def self.synopsis
      "stops and deletes all traces of the vagrant machine then starts and provisions the vagrant environment"
    end

    def execute
      require Vagrant.source_root.join("plugins/commands/destroy/command")
      require Vagrant.source_root.join("plugins/commands/up/command")
      
      destroy_args = []
      up_args = []

      options = {}
      options[:force] = false

      opts = OptionParser.new do |o|
        o.banner = "Usage: vagrant rebuild [options] [name]"
        o.separator ""
        o.separator "Options:"
        o.separator ""

        o.on("-f", "--force", "Destroy without confirmation.") do
          destroy_args.push('-f')
        end

        o.on("--provider PROVIDER", String,
          "Back the machine with a specific provider") do |provider|
          up_args.push("--provider")
          up_args.push("#{provider}")
        end

        o.on("--destroy-on-error",
          "Destroy machine if any fatal error happens (default to true)") do |destroy|
          up_args.push("--destroy-on-error")
        end

        o.on("--no-destroy-on-error",
          "WIll not destroy machine if any fatal error happens (default to true)") do |destroy|
          up_args.push("--no-destroy-on-error")
        end

        o.on("--parallel",
          "Enable parallelism if provider supports it") do |parallel|
          up_args.push("--parallel")
        end

        o.on("--no-parallel",
          "Disable parallelism if provider supports it") do |parallel|
          up_args.push("--no-parallel")
        end

        o.on("--provision", "Enable provisioning") do |p|
          up_args.push("--provision")
        end

        o.on("--no-provision", "Disable provisioning") do |p|
          up_args.push("--no-provision")
        end

        o.on("--provision-with x,y,z", Array,
                "Enable only certain provisioners, by type.") do |list|
          up_args.push("--provision-with")
          list.each do |p|
            up_args.push(p)
          end
        end

      end

      argv = parse_options(opts)
      return if ! argv

      destroy_args.concat(argv)
      up_args.concat(argv)

      destroy = VagrantPlugins::CommandDestroy::Command.new(destroy_args, @env)
      destroy.execute

      up = VagrantPlugins::CommandUp::Command.new(up_args, @env)
      up.execute
      
      return 0
    end
  end
end
