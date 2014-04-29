describe Remover::CLI do
  let(:options) do
    {
      'organization' => 'MANasyrov2',
      'login' => 'InFinite',
      'password' => '000000',
      'verbose' => 'true'
    }
  end

  let(:configuration) { Remover::Configuration.new }

  describe '#verbose' do
    before do
      configuration.load_from_options!(options)
    end

    context 'verbose not entered' do
      let(:options) do {
        'verbose' => 'false'
      }
      end

      it 'returns false' do
        expect(configuration.verbose).not_to eq('true')
      end
    end

    it 'returns true' do
      expect(configuration.verbose).to eq('true')
    end
  end
end
