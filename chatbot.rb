require './colour.rb'
require 'yaml'


def get_response(input)
  key = @responses.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = @responses[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2, c3: $3, c4: $4}
end

def computer_prompt
  print "Computer: ".green
end

def user_prompt
  print "User: ".red
end

computer_prompt
puts "Hello, what's your name?".green
user_prompt
name = gets.chomp
computer_prompt
puts "Hello #{name}".green


def load 
  load = File.read('./responses.yml')
  @responses = YAML::load(load)
end
load

def save
  yaml = YAML::dump(@responses)
  mode = "w+"
  file = open("./responses.yml", mode)
  file.write("#{yaml}")
  file.close
end


def add_response
  print "Add trigger: ".red
  key = gets.chomp
  print "Add response: ".red
  value = gets.chomp
  @responses[key] = value
  save
end 

user_prompt
while (input = gets.chomp) do

  if input.downcase == "exit"
    puts "Computer: Goodbye".green
    save
    break
  end
  
  if input.downcase == "add"
    add_response
    user_prompt
    input = gets.chomp
  end

  computer_prompt
  puts "#{get_response(input)}".green
  user_prompt
end












