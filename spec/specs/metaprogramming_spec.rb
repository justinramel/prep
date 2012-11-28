#Metaprogramming Building Blocks
#
#define_method(name,&block)
#instance_variable_{get,set} (@{name})

class Class
  def accessors(*names)
    names.each do|attribute_name|
     define_method(attribute_name) do
       instance_variable_get("@#{attribute_name}")
     end
     define_method("#{attribute_name}=") do |value|
       instance_variable_set("@#{attribute_name}", value)
     end
    end
  end
end
class Person
  def initialize_attributes_using(values)
    values.each_key do |attribute_name|
      self.class.send(:define_method, attribute_name) do
         instance_variable_get("@#{attribute_name}")
      end
    end
  end
  def initialize(values = Hash.new(nil))
    initialize_attributes_using values
  end

end

describe 'Metaprogramming' do
  let(:age){34}
  let(:name){'JP'}
  let(:sut){Person.new(:name => name,:age => age)}

  context 'adding attributes' do
    it 'should be able to add a smarter attribute assignment style' do
      sut.name.should == name
      sut.age.should == age

      sut.name = "Justin"
      sut.name.should == "Justin"
    end
  end
end

