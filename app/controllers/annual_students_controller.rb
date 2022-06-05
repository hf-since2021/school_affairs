class AnnualStudentsController < ApplicationController
  before_action :set_logined_term

  def index
    # ビュー(html)を渡すのとtableの内容(json)を渡すのは別々にする方がよさそう
    # 具体的には、window.onloadでxhrのgetメソッドでjsonデータのみを渡すアクションへのリクエストをして、
    # そのレスポンスでtableを表示させる。
    # このようにすれば、jsonのみをやりとりするアクションによって、このindexからデータをビューに渡して、
    # htmlに埋め込んだデータからJavascriptでtableデータを整形する必要がなくなりそう。
  end

  def edit
  end

  def update
    # binding.pry
  end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end
end
