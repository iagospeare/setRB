require 'green_shoes'

Shoes.app :title => "The Game of Set", 
width: 1000, height: 750 do
background green
fill white
class Actions
		@myApp
		
		def initialize(myApp)
			@myApp = myapp
			@player1score = 0
			@player2score = 0
		end

		def replace(slotID, card)
			cardID  = "img#{slotID}.png"
			@cardList[slotID] = cardID
			@imageList[slotID].path = card
		end
		
end
#variable setup
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
			
		flow do #inner flow 4
			button "Replace Set" do
				string = ""
				x = @imageList.length
				alert("#{x}")	
				i = 0
				x.times do
					if @checkList[i].checked? 
						#if card checked, corresponding card name from array is pulled
						@imageList[i].path = "img#{(i+1)*3}.png" #temporary replacement code
						@checkList[i].checked =false
					end
					i+=1			
	 		   end
			end
			button "deal" do #dani here
				
			end
		end #inner flow 4
	end
	

end

