#!/usr/bin/env ruby
# frozen_string_literal: true

require 'slop'
require 'debug'

class FunCLI
  def initialize
    @opts = Slop.parse do |o|
      o.banner = "Usage: ruby cli.rb [command] [options]"

      o.separator ""
      o.separator "Commands:"
      o.separator "  greet    - Say hello with custom greeting options"
      o.separator "  fortune  - Get a random fortune"
      o.separator "  debug    - Demonstrate the debug gem"
      o.separator ""
      o.separator "Options:"

      o.string '-n', '--name', 'Your name', default: 'Friend'
      o.bool '-c', '--colorful', 'Use colorful output', default: true
      o.bool '-h', '--help', 'Show this help message'

      o.on('--version', 'Display the version') do
        puts "FunCLI v1.0.0"
        exit
      end
    end

    if @opts.help? || ARGV.empty?
      puts @opts
      exit
    end
  end

  def run
    puts 1
    command = ARGV.shift
    binding.break

    case command
    when 'greet'
      greet_command
    when 'fortune'
      fortune_command
    when 'debug'
      debug_command
    else
      puts "Unknown command: #{command}".red
      puts @opts
    end
  end

  private

  def greet_command
    time = Time.now
    greeting = if time.hour < 12
                "Good morning"
              elsif time.hour < 18
                "Good afternoon"
              else
                "Good evening"
              end

    message = "#{greeting}, #{@opts[:name]}!"

    if @opts.colorful?
      puts message.green
    else
      puts message
    end
  end

  def fortune_command
    fortunes = [
      "You will have a great day today!",
      "An exciting opportunity awaits you.",
      "Your code will run without bugs today.",
      "Someone special is thinking about you.",
      "Your next commit will solve a major problem.",
      "A pleasant surprise is on its way.",
      "Your future pull requests will be approved without comments.",
      "Today is your lucky day to start a new project."
    ]

    fortune = fortunes.sample

    if @opts.colorful?
      puts "🔮 " + fortune.cyan
    else
      puts "Fortune: #{fortune}"
    end
  end

  def debug_command
    puts "Starting debug demonstration...".yellow
    puts "This will open the Ruby debugger. Use 'c' to continue and exit.".yellow

    # Create some variables for inspection
    demo_array = [1, 2, 3, 4, 5]
    demo_hash = { name: "Debug Demo", status: "active", count: 42 }

    # Start the debugger
    debugger

    # This code runs after continuing from the debugger
    puts "Debug session ended.".green
    puts "In the debugger, you could have inspected:".cyan
    puts "- demo_array: #{demo_array}".cyan
    puts "- demo_hash: #{demo_hash}".cyan
  end
end

# Run the CLI
FunCLI.new.run
