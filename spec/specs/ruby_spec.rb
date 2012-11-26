describe 'Ruby' do
  context 'when working with strings' do
    it 'should be able to initialize a string' do
      age = 34
      name = "JP Boodhoo is #{age}"
      name.start_with?("JP").should be_true
    end
  end
end

