require 'rails_helper'

RSpec.describe CreatePlay, type: :model do

  it { is_expected.to validate_presence_of(:blob) }
  it { is_expected.to validate_presence_of(:timer) }


  describe '#create_record' do
    context 'when valid' do
      let(:record) do
        described_class.new(
            blob: blob_id,
            timer: 1
        )
      end

      it { expect(record.create_record).to be_instance_of(Play) }
      it { expect{ record.create_record }.to change { Play.count }.by 1 }
    end

    context 'when invalid' do
      let(:record) do
        described_class.new(
            timer: 1
        )
      end

      it { expect(record.create_record).to eq nil }
    end
  end

  describe '#find_blob' do
    context 'when valid' do
      let(:record) do
        described_class.new(
            blob: blob_id,
            timer: 1
        )
      end

      it { expect(record.find_blob).to be_instance_of(ActiveStorage::Blob) }
    end

    context 'when invalid' do
      let(:record) do
        described_class.new(
            timer: 1
        )
      end

      it { expect(record.find_blob).to eq nil }
    end
  end
end
