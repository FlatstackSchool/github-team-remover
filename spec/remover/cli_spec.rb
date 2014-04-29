describe Remover::CLI do
  let(:options) do
    { 'organization' => 'FlatSchool',
      'login' => 'fs-school',
      'password' => '123456',
      'color' => :blue,
      'verbose' => 'true',
      'delete' => 'true'
    }
  end

  let(:configuration) { Remover::Configuration.new }

  describe '#color' do
    before do
      configuration.load_from_options!(options)
    end

    it 'returns true' do
      expect(configuration.color).to eq(:blue)
    end

    context '--color not used' do
      let(:options) do
        {
          'color' => :white
        }
      end

      it 'is default => :white' do
        expect(configuration.color).to eq(:white)
      end
    end
  end

  describe '#verbose' do
    before do
      configuration.load_from_options!(options)
    end

    it 'returns true' do
      expect(configuration.verbose).to eq('true')
    end

    context '--verbose not used' do
      let(:options) do
        {
          'verbose' => 'false'
        }
      end
      it 'returns false' do
        expect(configuration.verbose).not_to eq('true')
      end
    end
  end

  describe '#delete_team' do
    before do
      configuration.load_from_options!(options)
    end

    it 'returns true' do
      expect(configuration.delete).to eq('true')
    end

    context 'if --delete key not entered' do
      let(:options) do
        {
          'delete' => 'false'
        }
      end

      it 'returns false' do
        expect(configuration.delete).not_to eq('true')
      end
    end
  end
end
