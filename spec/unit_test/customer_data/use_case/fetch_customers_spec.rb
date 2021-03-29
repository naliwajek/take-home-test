describe CustomerData::UseCase::FetchCustomers do
  let(:fake_customer_gateway) { double }
  subject { described_class.new(customer_gateway: fake_customer_gateway) }

  before do
    allow(fake_customer_gateway).to receive(:fetch_customers_locations_json)
      .and_return([
        { 'latitude': '52.9', 'user_id': 2, 'name': 'Christina', 'longitude': '-6.0'},
        { 'latitude': '51.9', 'user_id': 1, 'name': 'Alice', 'longitude': '-10.2'}
      ])
  end

  context '#call' do
    it 'returns customers wrapped in a domain object' do
      expect(subject.call.count).to eq(2)
      expect(subject.call[0].latitude).to eq(52.9)
      expect(subject.call[1].name).to eq('Alice')
    end
  end
end