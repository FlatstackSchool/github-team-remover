describe Remover::CLI do
  let(:options) do
    {
      'organization' => 'FlatSchool',
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

    it 'true' do
      expect(configuration.verbose).to eq('true')
    end

    context 'if #verbose false' do
      let(:options) do
        {
          'verbose' => 'false'
        }
      end

      it 'false' do
        expect(configuration.verbose).to eq('false')
      end
    end
  end

  describe '#remove' do
    before do
      configuration.load_from_options!(options)
    end

    it 'true' do
      expect(configuration.remove).to eq('true')
    end

    context 'if #remove false' do
      let(:options) do
        {
          'remove' => 'false'
        }
      end

      it 'false' do
        expect(configuration.remove).to eq('false')
      end
    end
  end
end
