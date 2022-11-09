puts "ジャンケンッ..."

def janken
  
  choices = ["グー", "チョキ", "パー"]
  ShowStartMessage(choices)
  
  check_hand = gets.chomp
  player_hand = check_hand.to_i
  program_hand = rand(choices.size)
  
  if check_hand == "0" || check_hand == "1" || check_hand == "2"
  
  ShowChoiceInfo(choices[player_hand], choices[program_hand])
  
   @result = 0 #0:負け 1:勝ち 2:あいこ
   if player_hand == program_hand
     @result = 2
     puts "あいこで..."
     janken()
     
   elsif ((player_hand == 0 && program_hand == 1) || (player_hand == 1 && program_hand ==2) || (player_hand ==2 && program_hand ==0))
     @result = 1
     puts "(あと一息！)"
     hoi()

   else
    puts "(気をつけて！)"
    @result = 0
    hoi()
   end
  
  else
    puts "あれれ、変な値が入力されているよ"
    janken()
  end
end

def hoi
  puts "あっち向いて..."
  choices = ["上", "下", "左", "右"]
  ShowStartMessage(choices)
  
  check_direction = gets.chomp
  player_direction = check_direction.to_i
  program_direction = rand(choices.size)
  
  if check_direction == "0" || check_direction == "1" || check_direction == "2" || check_direction == "3"
  
  ShowChoiceInfo(choices[player_direction], choices[program_direction])
  
   if  ((@result == 1) && (player_direction == program_direction))
    puts "You Won! You're Genious! You're Awesome!"
    @finalResult = 1
    
   elsif ((@result == 0) && (player_direction == program_direction))
    puts "ハッハッハッハ、無様だな。一昨日きやがれ。"
    @finalResult = 0
    
   else 
    puts "ジャンケンッ..."
    janken()
   end
  
  else 
    puts "あれれ、変な値が入力されているよ。ジャンケンからやり直し..."
    puts "ジャンケンッ..."
    janken()
  end
end

def ShowStartMessage(choices)
  puts "----------"
  puts "以下の数字いずれかを選択して入力して下さい"
  numChoices = choices.size
  for i in 0..(numChoices-1) do
    puts i.to_s + "(" + choices[i] + ")"
  end
  puts "----------"
end

def ShowChoiceInfo(playerChoicesString, programChoicesString)
  puts "ホイッ！"
  puts "----------"
  puts "あなた：#{playerChoicesString}"
  puts "相手：#{programChoicesString}"
  puts "----------"
end

loop {
  janken()
  if @finalResult == 1 || @finalResult == 0
    break
  end
}