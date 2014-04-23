describe Remover::Commander do
  let(:commands) do
    {
      'color' => 'blue',
      'verbose' => 'true',
      'delete' => 'true'
    }
  end

  let(:commander) { Remover::Commander.new }

  describe '#load from commands!(commands)' do
    before do
      commander.load_from_commands!(commands)
    end

    it 'setting commands' do
      expect(commander.color).to eq('blue')
      expect(commander,verbose).to eq('true')
      expect(commander.delete).to eq('true')
    end
  end
end
