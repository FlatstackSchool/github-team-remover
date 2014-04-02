describe Remover::Configuration do
  let(:options) do
    {
      'organization' => 'FlatSchool',
      'username' => 'fs-school',
      'password' => '123456'
    }
  end

  let(:configuration) { Remover::Configuration.new }

  describe '#load_from_options!(options)' do
    before do
      configuration.load_from_options!(options)
    end

    it 'sets options' do
      expect(configuration.organization).to eq('FlatSchool')
      expect(configuration.username).to eq('fs-school')
      expect(configuration.password).to eq('123456')
    end
  end
end
