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
			s = i+1
		else
			winner = p[s][1]
		end	
	end
	if(winner != 0)
		puts "Player #{winner} wins"
	else
		puts "This is a draw.No Results"
	end
