require 'green_shoes'

class SetGui
Shoes.app :title => "The Game of Set", 
width: 1000, height: 750 do
	#@outerFlow = flow
	#@innerFlow = flow
background green
fill white
	@player1score = 0
	@player2score = 0
	@cardList = []
	@imageList = []

	12.times do |i| #iterable card file names
		@cardList << "img#{i+1}.png" 
	end
	@checkList = []
#Display Settings	
	border(white)	
	title("The Game of Set", size: 50, stroke: rgb(255, 255, 255), align: 'center')
	inscription('Brought to you by Team: Redacted', emphasis: 'italic', align: 'center')
	caption('SCORES', align: 'left', underline: 'single', weight: "bold")
	caption("Player One: #{@player1score}                       Player Two: #{@player2score}", weight: "ultralight")
	rect(left: 700, top: 200, width: 100, fill: rgb(0, 191, 255))
	rect(left: 710, top: 200, width: 100, fill: rgb(0, 191, 255))
	rect(left: 720, top: 200, width: 100, fill: rgb(0, 191, 255))
#begin display logic
	#
	@dealButton = button "deal"
	@replaceButton = button "ReplaceSet"
	flow do #outer flow
	slot = 0
	4.times do #12 cards for now, add 3 functionality will come later
		flow do #inner flow 1, 2, 3
			3.times do 
				@i = image @cardList[slot] #displays card image, add numbers later
				@imageList << @i
				@checkList << check;
				slot += 1
					#both adds a new check to array and displays a check in-line with flow layout
			end 	
		end #inner flow 1
	end

#button logic			
		stack do #inner flow 4
			
			@replaceButton.click do
				string = ""
				x = @imageList.length
				i = 0

				x.times do
					if @checkList[i].checked? 
						#if card checked, corresponding card name from array is pulled
						# isSet =  controller.isSet? (cardID, cardID, cardID) # checks if the 3 are a set
						# card = controller.getCard #get new card from controller
					 	# controller.removeCard(cardID)  #send which card was replaced using unique card ID string
						@imageList[i].path = "img#{(i+1)*3}.png" # card from .getCard
						@checkList[i].checked = false
					end
					i+=1			
	 		   end
			end
			@cardsOnTable = 12
			@dealButton.click do
				4.times do |i| #iterable card file names
					@cardList << "img#{i+@cardsOnTable}.png" 
				end
				slot = @cardsOnTable +1
				#@innerFlow.append do
				flow do
				3.times do
						@i = image @cardList[slot]
						@imageList << @i
						@checkList << check;
						slot += 1
					#image @cardList[slot], height: 55, width:50, top:300, left:0+over
				
					end
				end
			@cardsOnTable += 3	

		#	end
		#	3.times do
				# card = controller.getCard #get new card
				# then figure out how to add it inline with rest of cards
		#	end
		end
		end #inner flow 4
	end #end outer flow
	
end
end
