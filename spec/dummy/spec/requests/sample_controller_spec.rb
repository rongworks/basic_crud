require_relative '../rails_helper'
require_relative '../spec_helper'

describe 'SampleController', type: :request do
  let!(:sample){ Sample.create(name: 'sample', description: 'tasty')}

  context 'html' do

    it 'shows samples on index' do
      get samples_path
      expect(response.status).to eq 200
      expect(response.body).to include 'sample'
      expect(response.body).to include 'tasty'
    end

    it 'displays the sample on show' do
      get sample_path(sample)
      expect(response.status).to eq 200
      expect(response.body).to include 'sample'
      expect(response.body).to include 'tasty'
    end

    it 'shows sample form on edit' do
      get edit_sample_path(sample)
      expect(response.status).to eq 200
      expect(response.body).to include 'sample'
      expect(response.body).to include 'tasty'
    end

    it 'shows sample form on new' do
      get new_sample_path(sample)
      expect(response.status).to eq 200
      expect(response.body).to include 'sample_name'
      expect(response.body).to include 'sample_description'
    end

    it 'can create a sample' do
      post samples_path, params: { sample: { description: 'fruity', name: 'fruitsample' } }

      expect(response.status).to eq 302
      expect(Sample.count).to eq 2
    end

    it 'can update a sample' do
      put sample_path(sample), params: { sample: { description: 'fruity', name: sample.name } }
      expect(response.status).to eq 302
      expect(sample.reload.description).to eq 'fruity'
    end

    it 'can delete a sample' do
      delete sample_path(sample)
      expect(response.status).to eq 302
      expect(Sample.count).to eq 0
    end
  end

  context 'json' do
    before :each do
    end

    it 'gets samples' do
      get samples_path, as: :json
      expect(response.status).to eq 200

      expect(response.body).to include sample.name
      expect(response.body).to include sample.description
    end

    it 'gets a single sample' do
      get sample_path(sample), as: :json

      expect(response.body).to include sample.name
      expect(response.body).to include sample.description
    end

    it 'can create samples' do
      post samples_path, params: {sample: {name: 'testy', description: 'tasty'}}, as: :json

      expect(response.status).to eq 201
      expect(get_content['name']).to eq 'testy'
      expect(Sample.count).to eq 2
    end

    it 'can update samples' do
      put sample_path(sample), params: {sample: {name: 'testy', description: sample.description}}, as: :json

      expect(response.status).to eq 200
      expect(sample.reload.name).to eq 'testy'
      expect(get_content['name']).to eq 'testy'
    end

    it 'can delete a sample' do
      delete sample_path(sample), as: :json

      expect(Sample.count).to eq 0
    end
  end

  def get_content
    JSON.parse(response.body)
  end
end