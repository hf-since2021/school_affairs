class ContactsController < ApplicationController
  before_action :set_logined_term

  def index
    day_of_week = ["日", "月", "火", "水", "木", "金", "土" ]
    @today_str = "#{Time.now.month}月 #{Time.now.day}日 (#{day_of_week[Time.now.wday]})"
  end

  def show
    day_of_week = ["日", "月", "火", "水", "木", "金", "土" ]
    @today_str = "#{Time.now.month}月 #{Time.now.day}日 (#{day_of_week[Time.now.wday]})"

    require "net/http"
    # local環境
    uri = URI.parse("http://localhost:3001/api/v1/contacts")
    # デプロイ
    # uri = URI.parse("")

    response = Net::HTTP.get_response(uri)
    @contacts = JSON.parse(response.body)

    @request_type = ['', '欠席', '遅刻', '早退']
    @absent_type = ['','','欠席','出席扱い','出停忌引']
    @in_and_out_time = ['','','朝学活','1時間目','2時間目','3時間目','4時間目','昼休み','5時間目','6時間目','終学活']
  end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end
end
