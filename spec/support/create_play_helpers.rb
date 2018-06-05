# frozen_string_literal: true

module CreatePlayHelpers
  def blob_id
    create_image.images.first.blob_id
  end

  private def create_image
    Post.create(images: [io: File.open(fixture_path + '/dummy_image.jpg'), filename: 'dummy_image.jpg'])
  end
end

RSpec.configure do |config|
  config.include CreatePlayHelpers, type: :model
end
