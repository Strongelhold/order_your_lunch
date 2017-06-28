RSpec.shared_examples 'validations' do |model|
  subject { create model }

  describe 'name' do
    it 'is present' do
      subject.name = ''
      expect(subject).not_to be_valid
    end
  end
end
