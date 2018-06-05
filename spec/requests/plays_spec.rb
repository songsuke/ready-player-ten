require 'rails_helper'

RSpec.describe 'Plays', type: :request do
  describe 'GET /plays' do
    before { get plays_path }
    it { expect(response).to have_http_status(200) }
  end

  describe 'POST /plays' do
    context 'success' do
      let(:play_params) do
        '{ "play":
          {
            "blob": 1,
            "timer": 1
          }
        }'
      end

      before do
        headers = { CONTENT_TYPE: 'application/json', ACCEPT: 'application/json' }
        allow_any_instance_of(CreatePlay).to receive(:create_record).and_return(Play.new)
        post '/plays', params: play_params, headers: headers
      end

      it { expect(response.content_type).to eq('application/json') }
      it { expect(response).to have_http_status(:created) }
    end

    context 'failed' do
      let(:play_params) do
        { play:
          {
            blob: 1,
            timer: 1
          }
        }
      end

      before do
        allow_any_instance_of(CreatePlay).to receive(:create_record).and_return(false)
        post plays_path, params: play_params
      end

      it { expect(response).to redirect_to plays_path }
    end
  end
end
