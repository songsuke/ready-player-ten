require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /" do
    before { get root_path }

    it { expect(response).to have_http_status(200) }
  end

  describe "Post /posts" do
    context 'success' do
      let(:post_params) do
        { post:
          {
            images: [
              io: File.open(fixture_path + '/dummy_image.jpg'),
              filename: 'dummy_image.jpg'
            ]
          }
        }
      end

      before { post posts_path, params: post_params }

      it { expect(response).to redirect_to(root_path) }
      it { expect(flash[:notice]).to eq 'Images have been uploaded successfully' }
    end

    context 'failed' do
      let(:post_params) do
        {post: { images: nil }}
      end

      before do
        allow_any_instance_of(Post).to receive(:save).and_return(false)
        post posts_path, params: post_params
      end

      it { expect(flash[:alert]).to eq 'Cannot upload the images' }
      it { expect(response).to render_template(:new) }
    end
  end
end
