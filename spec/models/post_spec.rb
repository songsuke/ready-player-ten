require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'images' do
    before do
      2.times do
        subject.images.attach(io: File.open(fixture_path + '/dummy_image.jpg'),
                              filename: 'attachment.jpg',
                              content_type: 'image/jpg')
      end
    end
    it { expect(subject.images).to be_attached }
    it { expect(subject.images.size).to eq 2 }
  end
end
