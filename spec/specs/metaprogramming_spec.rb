#Metaprogramming Building Blocks
#
#define_method(name,&block)

class Object
  def self.accessors(*names)
    names.each do|attribute_name|

    end
  end
end
class Person
  accessors :name,:age

  def initialize(name,age)
    @name = name
    @age = age
  end
end

describe 'Metaprogramming' do
  let(:age){34}
  let(:name){'JP'}
  let(:sut){Person.new(name,age)}
  
  context 'adding attributes' do
    it 'should be able to add a smarter attribute assignment style' do
      sut.name.should == name
      sut.age.should == age
    end
  end
end

