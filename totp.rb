#!/usr/bin/env ruby
#
# Print a TOTP token getting the shared key from pass(1).

require 'rotp'
require 'open3'
require 'cmdparse'

class GenerateCmd < CmdParse::Command
  def initialize
    super 'generate'
    short_desc 'Generate a code for a given service'
    takes_commands false
    argument_desc service: "Service for which the code is required"
  end

  def execute service
    command = "pass 2fa/#{service}/code"
    pass = nil

    Open3.popen3 command do | stdin, stdout, stderr, wait |
      pass = stdout.read
      err = stderr.read
      unless err.chomp.empty?
        warn err
        exit 2
      end
    end

    totp = ROTP::TOTP.new pass
    token = totp.now
    puts token

    Open3.popen3 "xclip" do | stdin, stdout, stderr, wait |
      stdin.puts token.chomp
      stdin.close
    end
  end
end

parser = CmdParse::CommandParser.new(handle_exceptions: :no_help)
parser.add_command(CmdParse::HelpCommand.new)
# parser.add_command(CmdParse::VersionCommand.new)
parser.add_command(GenerateCmd.new, default: true)
parser.add_command(AddServiceCmd.new, default: true)
parser.parse
