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
  end

  describe '#remove' do
    before do
      configuration.load_from_options!(options)
    end

    it 'true' do
      expect(configuration.remove).to eq('true')
    end
  end
end
