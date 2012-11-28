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
      loop do
        block.call( iterators.map { |iterator| iterator.next })
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

