# The CLI
print "+#{'=='*24}=+"
puts "\n|#{' ' * 6}Welcome to Twitter Sentiment Analyzer#{' ' * 6}|"
puts "|#{' ' * 11}An Andela BootCamp Project#{' ' * 12}|"
puts "|#{' ' * 23}by#{' ' * 24}|"
puts "|#{' ' * 14}Mubarak Adeshina IMAM#{' ' * 14}|\n"
print "+#{'=='*24}=+"
puts "\n\n#{' ' * 1}Please wait while we connect to"\
  " the Twitter API#{' ' * 1}\n\n"

require "./andelatsa"

if Connection.response_code == "200"
  puts "Connection successful"
else
  puts "Connection failed"
end

condition = true
while condition
  print "\nPlease, enter you Twitter Handle,"\
  " give a space\n"\
  "followed by the number of Tweets: "
  details = gets.chomp.split(" ")
  user = TwitterRequest.new(details[0], details[1].to_i)
  Helper.display_ranking(user.words_rank)

  File.delete(
  "tweets_only_#{details[0]}.json",
  "full_tweets_#{details[0]}.json")

  puts "Do you want to exit from the app? Yes/No"
  response = gets.chomp.downcase
  case response
  when "yes" || "y"
    condition = false
    puts "Thank you for your time. pls follow @andela and"
    puts "@mubarakadeimam on Twitter"
  when "no"
    puts "Okay, now you can continue"
  else
    puts "Sorry, I don't get that"
  end
end
