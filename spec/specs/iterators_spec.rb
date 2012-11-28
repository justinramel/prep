class Iteration
  class << self

    def sequence(first, second, third)
      first.each { |i| yield(i) }
      second.each { |i| yield(i) }
      third.each { |i| yield(i) }
    end

    def interleave(first, second, third)
      first_enum = first.to_enum
      second_enum = second.to_enum
      third_enum = third.to_enum
      loop do
        yield first_enum.next
        yield second_enum.next
        yield third_enum.next
      end
      loop do
        yield third_enum.next
      end
    end

    def bundle(first, second, third)
      first_enum = first.to_enum
      second_enum = second.to_enum
      third_enum = third.to_enum
      loop do
        yield [first_enum.next, second_enum.next, third_enum.next]
      end
    end

  end
end
describe 'Iterators' do
  context 'when dealing with external iterators' do
    let(:first){[1,2,3]}
    let(:second){ 4..6 }
    let(:third){ 'a'..'e' }

    it 'should be able to process a set of iterators in sequence' do
      results = []
      Iteration.sequence(first,second,third){|item| results << item}
      results.should == [1,2,3,4,5,6,'a','b','c','d','e']
    end

    it 'should be able to interleave the elements in multiple iterators' do
      results = []
      Iteration.interleave(first,second,third){|item| results << item}
      results.should == [1,4,'a',2,5,'b',3,6,'c','d','e']
    end

    it 'should be able to bundle the iterators into distinct groups of results' do
      results = []
      Iteration.bundle(first,second,third){|item| results << item}
      results.should == [[1,4,'a'],[2,5,'b'],[3,6,'c']]
    end
  end
end

