class CreatePlay
  include ActiveModel::Model

  attr_accessor :blob, :timer

  validates :blob, presence: true
  validates :timer, presence: true

  def create_record
    return unless valid?
    record = Play.new(timer: timer)
    record.image.attach(find_blob)
    record if record.save
  end

  def find_blob
    return unless blob
    ActiveStorage::Blob.find(blob)
  end
end
