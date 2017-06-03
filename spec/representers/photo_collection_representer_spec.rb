RSpec.describe PhotoCollectionRepresenter, type: :representer do
  let(:photo1) { create :photo, image_uid: "123" }
  let(:photo2) { create :photo, image_uid: "456" }
  let(:photo_collection) { PhotoCollection.new([photo1, photo2]) }
  let(:json) { read_json :photo_collection }

  it "renders photo collection as JSON" do
    expect(photo_collection.extend(PhotoCollectionRepresenter).to_json)
      .to eq json
  end
end
