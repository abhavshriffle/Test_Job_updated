class TrainUnavailableWorker
  include Sidekiq::Worker

  def perform(train_id, train_line_id)
    train = Train.find_by(id: train_id)
    train_line = Line.find_by(id: train_line_id)

    return unless train.present?
    return unless train_line.present?

    update_train_line_status(train_line)
    update_train_status(train)
  end

  private

  def update_train_line_status(train_line)
    train_line.update(status: 'available')
  end

  def update_train_status(train)
    train.update(status: true)
  end
end
