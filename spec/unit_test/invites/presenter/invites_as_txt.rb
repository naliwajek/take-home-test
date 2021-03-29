describe Invites::Presenter::InvitesAsTxt do
  let(:attributes) { [:name, :user_id] }
  let(:sort_key) { :user_id }
  subject do 
    described_class
      .new(attributes: attributes, sort_key: sort_key)
  end

  context 'for negative path from take home test' do
    let(:customers) { [] }

    it 'when list is empty' do
      expect(subject.present(customers: customers))
        .to eq(%Q(List of customers to invite for drinks:).strip)
    end
  end

  context 'for positive path from take home test' do
    let(:customers) {[
      CustomerData::Domain::Customer.new(51.1, -7.2, 'Bobby Copperhead', 456),
      CustomerData::Domain::Customer.new(51.1, -7.2, 'Johny Silverhand', 123),
      CustomerData::Domain::Customer.new(51.1, -7.2, 'Sammy Goldspine',  345),
    ]}

    it 'shows guest list as text' do
      expect(subject.present(customers: customers))
        .to eq(%Q(List of customers to invite for drinks:
name: Johny Silverhand, user_id: 123
name: Sammy Goldspine, user_id: 345
name: Bobby Copperhead, user_id: 456))
    end
  end
end