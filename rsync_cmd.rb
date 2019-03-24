require "json"
json = File.read(File.join(__dir__, "config", [ARGV[0], "json"].join(".")))
config = JSON.parse(json)
required = ["excludes", "from", "to"]
if (required - config.keys).size > 0
  puts "Missing required keys: #{required - config.keys}"
  exit
end

ex = config["excludes"].map { |e| "--exclude '#{e}'"}.join(" ")

from = config["from"]
if config["external"]
  if !config.keys.include?("host")
    puts "Missing 'host' for external system"
    exit
  end

  from = "-e ssh #{config["host"]}:#{from}"
end

to = config["to"]

system "rsync -avz --delete #{ex} #{from} #{to}  --log-file=logs/#{ARGV[0]}.log"
