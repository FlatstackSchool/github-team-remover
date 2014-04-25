describe Remover::CLI do
  let(:options) do
    { 'organization' => 'FlatSchool',
      'login' => 'fs-school',
      'password' => '123456',
      'verbose' => 'true',
      'remove' => 'true'
    }
  end
  let(:configuration) { Remover::Configuration.new }

  describe '#verbose' do
    before do
      configuration.load_from_options!(options)
    end

    it 'returns true' do
      expect(configuration.verbose).to eq('true')
    end

    context 'if --verbose key not entered' do
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

  describe '#remove' do
    before do
      configuration.load_from_options!(options)
    end

    it 'returns true' do
      expect(configuration.remove).to eq('true')
    end

    context 'if --remove key not entered' do
      let(:options) do
        {
          'remove' => 'false'
        }
      end

      it 'returns false' do
        expect(configuration.remove).not_to eq('true')
      end
    end
  end
end
