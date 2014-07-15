describe Vote do 
	describe "validations" do 
		describe "value validation" do 
			it "only allows -1 or 1 as values" do 
				# your expectations here
				before do 
					@up_vote = Vote.new(value: 1)
					@down_vote = Vote.new(value: -1)
					2.times {@up_vote}
					3.times {@down_vote}
				end

				describe 'up votes' do
				expect (@up_vote.all).to eq(2)

        describe 'down votes' do
				expect(@down_vote.all).to eq(-3)

				describe 'total votes' do
				expect(Vote.all).to eq(-1) 
			end 
		end
	end
end