describe Geo::UseCase::CalculateInRange do
  subject { described_class.new(
    source_lat: source_lat,
    source_lon: source_lon,
    target_lat: target_lat,
    target_lon: target_lon
  ) }

  context 'when points apart but within distance' do
    let(:source_lat) { 52.986375 }
    let(:source_lon) { -6.043701 }
    let(:target_lat) { 53.339428 }
    let(:target_lon) { -6.257664 }

    it 'shows points are in range' do
      expect(subject.call(in_range_of_km: 6000)).to eq(true)
    end
  end

  context 'when points apart but not within distance' do
    let(:source_lat) { 52.986375 }
    let(:source_lon) { -6.043701 }
    let(:target_lat) { 53.339428 }
    let(:target_lon) { -6.257664 }

    it 'shows points are not in range' do
      expect(subject.call(in_range_of_km: 10)).to eq(false)
    end
  end

  context 'when points are the same' do
    let(:source_lat) { 52.986375 }
    let(:source_lon) { -6.043701 }
    let(:target_lat) { 52.986375 }
    let(:target_lon) { -6.043701 }

    it 'it is always a match, even for zero distance' do
      expect(subject.call(in_range_of_km: 0)).to eq(true)
    end
  end
end