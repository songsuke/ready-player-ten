require 'rails_helper'

RSpec.describe Play, type: :model do
  describe 'image' do
    before do
      subject.image.attach(io: File.open(fixture_path + '/dummy_image.jpg'),
                           filename: 'attachment.jpg',
                           content_type: 'image/jpg')
    end

    it { expect(subject.image).to be_attached }
  end
end
