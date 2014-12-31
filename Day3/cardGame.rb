class Player

	attr_accessor :player_cards, :power

	def initialize
		@player_cards = []
		@power=[6,5]
	end

	def display
		p player_cards.to_s
	end
	def distribute(cards)
		player_cards.push(cards)
	end
	

	def setPower
		power1 = Rule.new player_cards
		@power = power1.checkPower
	end
	
end

class Deck

	attr_accessor :cardArray

	def initialize
		@cardArray = []
	end

	def get_card
		cardArray.delete_at(rand(cardArray.length))
	end

	def create_card
		current_suit = 's'
		for i in 0..51
			cardArray[i] = Card.new
			if i == 13
				current_suit='c'
			elsif i == 26
				current_suit='d'
			elsif i == 39
				current_suit='h'
			end
			cardArray[i].suit =
			current_suit
			cardArray[i].number = ((i)%13+1)
		  #cardArray[i].to_s
		
		end
	end

end

class Card

    attr_accessor :suit, :number

    def to_s
      puts "  #{suit} , #{number}"
    end

end


class Rule
  attr_accessor :cards

  def initialize cards
    @cards=  cards.sort_by { |card| card.number}
  end
	
  def checkPower
      isTrial
  end

  def isTrial
    if(cards[0].number.to_i == cards[1].number.to_i  && cards[1].number.to_i== cards[2].number.to_i)
      [1,cards[0].number]
    else
      isDoubleRun
    end
  end
  
  def isDoubleRun
    if(isRun[0]==3 && isColor[0]==3)
      [2,isRun]
    else
      isRun
    end
  end

  def isRun
     if(cards[0].number.to_i == cards[1].number.to_i-1 && cards[1].number.to_i-1==cards[2].number.to_i-2)
       [3,cards[2].number]
     elsif(cards[0].number.to_i == 1 && cards[1].number.to_i == 12 && cards[2].number.to_i == 13)
       [3,14]
     else
       isColor
     end

  end


  def isColor
    if(cards[0].suit == cards[1].suit && cards[1].suit == cards[2].suit)
      [4,cards[2].number,cards[1].number,cards[0].number]
    else
      twoOfAKind
    end
  end

  def twoOfAKind
    if(cards[0].number == cards[1].number)
	   [5,cards[0].number,cards[2].number]
    elsif(cards[1].number== cards[2].number)
	   [5,cards[1].number,cards[0].number]
    elsif(cards[0].number== cards[2].number)
       [5,cards[2].number,cards[1].number]
    else
       [6,cards[2].number,cards[1].number,cards[0].number]
    end
  end
end


#function for power condition
def powerCase player_index
	p = player_index.sort_by{|val| val[0].power[1]}.reverse
	s = 0
	temp = p[s][0]
	for i in 0..player_index.length-2
		if(temp.power[1]==p[i+1][0].power[1])
			if(temp.power[2]<p[i+1][0].power[2] && temp.power[2]!=1)
				winner = p[i+1][1]
				temp = p[i+1][0]
				s= i+1
			elsif(temp.power[2]==p[i+1][0].power[2])
				if(temp.power[3]<p[i+1][0].power[3] && temp.power[3]!=1)
					winner = p[i+1][1]
					temp = p[i+1][0]
					s = i+1
				elsif(temp.power[3]==p[i+1][0].power[3])
					winner = 0
				else
					winner = p[s][1]
				
				end
			else
				winner = p[s][1]
			end
		elsif(temp.power[1]<p[i+1][0].power[1] && temp.power[1]!=1)
			winner = p[i+1][1]
			temp = p[i+1][0]
			s =i+1
		else
			winner = p[s][1]
		end
			
	end
	if(winner != 0)
		puts "Player #{winner} wins"
	else
		puts "This is a draw.No Results"
	end
end


#function for run condition
def runCase player_index
	p = player_index.sort_by{|val| val[0].power[1]}.reverse
	s = 0
	temp = p[s][0]
	for i in 0..player_index.length-2
		if(temp.power[1]==p[i+1][0].power[1])
			winner = 0
		elsif(temp.power[1]<p[i+1][0].power[1] && temp.power[1]!=3)
			winner = p[i+1][1]
			temp = p[i+1][0]
			s =i+1
		elsif(temp.power[1]==3 && p[i+1][0].power[1]==14)
			winner = p[i+1][1]
			temp = p[i+1][0]
			s =i+1
		else
			winner = p[s][1]			
		end	
	end
end


print "Enter the Number of player :: "
no_of_players = gets.to_i

players = []
for i in 0..no_of_players-1
  players[i] = Player.new
end

d = Deck.new
d.create_card


#Distribute cards among respective players
for j in 0..2
  for i in 0..no_of_players-1
    random_card = d.get_card
    players[i].distribute(random_card)
  end
end

for i in 0..no_of_players-1
  puts "Player #{i+1}::\n"
  players[i].display
  players[i].setPower
end
winner = 1
p = players.sort_by{|val| val.power}
high_power=p[0].power[0]
player_index = []
for i in 0..no_of_players-1
  if(players[i].power[0] == high_power)
	player_index.push([players[i],i+1])
  end
end
if(player_index.length == 1)
	puts "Player #{player_index[0][1]} wins"
elsif high_power==6     #condition for the power case
	powerCase player_index
elsif(high_power==5) #condition for two of a kind
	p = player_index.sort_by{|val| val[0].power[1]}.reverse	
	if(p[0][0].power[1]<p[1][0].power[1] && p[0][0].power[1]!=1)
		winner = p[1][1]
	elsif(p[0][0].power[1] == p[1][0].power[1])
		if(p[0][0].power[2] < p[1][0].power[2] && p[0][0].power[2]!=1)
			winner = p[1][1]
		elsif(p[0][0].power[2] == p[1][0].power[2])
		else
			winner = 0
		end	
	else winner = p[0][1]
	end
	if(winner != 0)
		puts "Player #{winner} wins"
	else
		puts "This is a draw.No Results"
	end
elsif(high_power==4) #condition for color
	powerCase player_index
elsif(high_power==3) #condition for run
	runCase player_index
elsif(high_power==2) #condition for double run
	runCase player_index
elsif(high_power==1)  #condition for trial
	p = player_index.sort_by{|val| val[0].power[1]}.reverse
	winner = p[0][1]
end
