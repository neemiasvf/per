class AnalyzerJob < ApplicationJob
  queue_as :default

  def analysis
    arguments.first
  end

  after_enqueue do
    analysis.update_columns(queued_at: DateTime.now, status: 1)
  end

  before_perform do
    analysis.update_columns(started_at: DateTime.now, status: 2)
  end

  after_perform do
    analysis.update_columns(finished_at: DateTime.now, status: 3)
  end

  def perform(analysis)
    analyzer = Analyzer.new(analysis)
    analyzer.pre_splice
    analyzer.splice(0)
    analyzer.post_splice
  end
end
