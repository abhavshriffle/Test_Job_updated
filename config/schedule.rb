every 3.hours do
  runner 'TrainUnavailableWorker.mark_as_unavailable_until_departure_async(3.hours)'
end
