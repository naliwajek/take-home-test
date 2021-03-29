describe CustomerData::Gateway::CustomersFileByUrl do
  let(:url) { "http://example.com/customers.txt"}
  subject { described_class.new(file_url: url) }
  let(:blob_data) {
    %Q(
{"latitude": "52.986375", "user_id": 12, "name": "Christina McArdle", "longitude": "-6.043701"}
{"latitude": "51.92893", "user_id": 1, "name": "Alice Cahill", "longitude": "-10.27699"}
{"latitude": "51.8856167", "user_id": 2, "name": "Ian McArdle", "longitude": "-10.4240951"}
    )
  }

  before do
    stub_request(:get, url).to_return(body: blob_data)
  end

  it "returns customers' location data in a hash format" do
    expect(subject.fetch_customers_locations_json).to eq([
      {"latitude": "52.986375", "user_id": 12, "name": "Christina McArdle", "longitude": "-6.043701"},
      {"latitude": "51.92893", "user_id": 1, "name": "Alice Cahill", "longitude": "-10.27699"},
      {"latitude": "51.8856167", "user_id": 2, "name": "Ian McArdle", "longitude": "-10.4240951"}
    ])
  end
end