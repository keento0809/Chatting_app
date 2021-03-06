class RoomsController < ApplicationController
  # Deviseで使えるようになるヘルパーメソッド。コントローラーに設定して、ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!　

  def show
    # メッセージ一覧を取得
    @messages = Message.all
  end
end
