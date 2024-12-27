class DocumentsController < ApplicationController
 # before_action :authenticate_user!
  def index
    @documents = Document.order(:start_date)
    @document = Document.new
    @week_days = generate_week_days_with_documents(@documents)
  end

  def generate_week_days_with_documents(documents)
    # 現在の日付から1週間の日付情報を含むArrayを生成
    start_date = Date.today.beginning_of_week
    end_date = Date.today.end_of_week

    week_days = (start_date..end_date).map do |date|
      {
        month: date.month,
        date: date.day,
        wday: date.strftime('%a'), # 曜日名
        documents: documents.select { |doc| 
          doc.start_date <= date && doc.end_date >= date
        }
      }
    end

    week_days
  end
end