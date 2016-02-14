#!/usr/bin/env ruby
#
# Print a TOTP token getting the shared key from pass(1).

require 'rotp'
require 'open3'

if ARGV.size != 1
  warn "Usage: #{File.basename(__FILE__)} SERVICE"
  exit 1
end

cmd = "pass 2fa/" + ARGV[0] + "/code"
pass = nil

Open3.popen3(cmd) do | stdin, stdout, stderr, wait |
  pass = stdout.read
  err = stderr.read
  if not err.chomp.empty?
    puts err
    exit 2
  end
end

totp = ROTP::TOTP.new(pass)
token = totp.now
puts token

Open3.popen3("xclip") do | stdin, stdout, stderr, wait |
  stdin.puts(token.chomp)
  stdin.close
end
