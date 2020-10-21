require 'rails_helper'
describe ItemsController, type: :request do
  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get root_path
      expect(response.status).to eq 200
    end
    it "indexアクションにリクエストするとレスポンスに検索フォームが存在する" do
      get root_path
      expect(response.body).to include "キーワードから探す"
    end
  end

end
