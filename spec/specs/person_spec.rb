require 'spec_helper'

describe Person do
  let(:sut){Person.new}

  context 'when created with no information' do

    it 'should have a sensible first and last name' do
      sut.first_name.should == "John"  
      sut.last_name.should == "Doe"  
    end
  end

  context 'when the names are changed' do
    before (:each) do
      sut.change_name_to("JP Boodhoo")
    end
    
    it 'should update the first and last name' do
      sut.first_name.should == "JP"
      sut.last_name.should == "Boodhoo"
    end
  end
  context 'when changing the name parts' do
    it 'should be able to change the first name' do
      sut.first_name = "JP"

      sut.first_name.should == "JP"
    end
    it 'should be able to change the last name' do
      sut.last_name= "Boodhoo"  

      sut.last_name.should == "Boodhoo"
    end
  end
  context 'when an attribute is added' do
    it 'should be able to be accessed' do
      sut.first_name.should == "John"
    end
  end
  
  context 'when intialized with extra information' do
    before (:each) do

    end
    
    
    let(:sut){Person.new(:first_name => 'JP',
                        :last_name => 'Boodhoo')}
    it 'should populate the names accordingly' do
      sut.first_name.should == 'JP'      
      sut.last_name.should == 'Boodhoo'      
    end
  end

  context 'dealing with hashes' do
    it 'should be able to create an object' do
     items = {:first_name => 'JP',:last_name => 'Boodhoo'} 

     person = items.to_strong_object

     person.first_name.should == 'JP'
    end
  end

  context 'when possessions are added' do
    let(:sut){Person.new {|item| p "Hello from #{item.name}"}}
    it 'should be able to process each of the possessions using a visitor' do
      
      20.times do|item|
        sut.add_possession(Possession.new("Possession #{item}"))
      end

      sut.each do |item|
        p item.name
      end

      message = -> {p 'We are done here'}
      message.call
    end
  end
  
  
end

