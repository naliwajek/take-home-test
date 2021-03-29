describe CustomerData::Domain::Customer do
  subject { described_class.new(51.1, -7.2, 'Johny Silverhand', 123) }

  context '#longitude' do
    it 'returns longitude' do
      expect(subject.longitude). to eq(-7.2)
    end
  end

  context '#latitude' do
    it 'returns latitude' do
      expect(subject.latitude). to eq(51.1)
    end
  end

  context '#name' do
    it 'returns name' do
      expect(subject.name). to eq('Johny Silverhand')
    end
  end

  context '#user_id' do
    it 'returns user_id' do
      expect(subject.user_id). to eq(123)
    end
  end

  context '#lon' do
    it 'works as a shortcut for longitude' do
      expect(subject.lon). to eq(subject.longitude)
    end
  end

  context '#lat' do
    it 'works as a shortcut for latitude' do
      expect(subject.lat). to eq(subject.latitude)
    end
  end
end