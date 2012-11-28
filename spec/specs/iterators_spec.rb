class Iteration
  class << self
    def sequence(*enumerables,&block)
      enumerables.each{|item| item.each(&block)}
    end

    def interleave(*enumerables,&block)
      iterators = enumerables.map{|item| item.to_enum}
      until iterators.empty?
        begin
          iterator = iterators.shift
          yield iterator.next
          iterators << iterator
        rescue StopIteration
        end
      end
    end

    def bundle(*enumerables,&block)
      iterators = enumerables.map{|item| item.to_enum}

      loop{yield iterators.map{|iterator| iterator.next}}
    end

    def inject(enumerable, result, &block)
      iterator = enumerable.to_enum
      loop { result = yield iterator.next, result }
      result
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

    it 'should be able to emulate injection' do
      numbers = (1..10).to_a
      result = Iteration.inject(numbers,0){|number,sum| number + sum}
      result.should == 55
    end

  end
end

