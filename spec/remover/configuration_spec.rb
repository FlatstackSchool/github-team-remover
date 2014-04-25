describe Remover::Configuration do
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

  describe '#load_from_options!(options)' do
    before do
      configuration.load_from_options!(options)
    end

    it 'sets options' do
      expect(configuration.organization).to eq('FlatSchool')
      expect(configuration.login).to eq('fs-school')
      expect(configuration.password).to eq('123456')
      expect(configuration.verbose).to eq('true')
      expect(configuration.remove).to eq('true')
    end
  end
end
