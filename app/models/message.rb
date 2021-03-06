class Message < ApplicationRecord
    validates :content, presence: true
    # validationとデータ作成後にジョブを実行させるよう追記する
    # craeteの後にコミットする { MessageBroadcastJobのperformを遅延実行。引数はself }
    after_create_commit { MessageBroadcastJob.perform_later self }
end
