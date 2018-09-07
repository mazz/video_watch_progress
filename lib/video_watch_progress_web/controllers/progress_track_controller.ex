defmodule VideoWatchProgressWeb.ProgressTrackController do
  use VideoWatchProgressWeb, :controller

  alias VideoWatchProgress.EventStore

  require Logger

  def track_progress(conn, params) do
    Logger.info(inspect(params))

    params
    |> Map.merge(%{"last_track_timestamp" => :os.system_time(:millisecond)})
    |> EventStore.enqueue()

    send_resp(conn, 200, "")
  end

  def get_progress(conn, params) do
    send_resp(conn, 200, "")
  end
end