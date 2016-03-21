defmodule ProxyBee.Handler do
  import Plug.Conn

  def init(options), do: options

  def call(conn, opts) do
    response = call_upstream(conn, opts)
    conn
    |> merge_resp_headers(response.headers)
    |> send_resp(response.status_code, response.body)
  end

  defp call_upstream(conn, [upstream: upstream]) do
    {:ok, body, conn} = read_body(conn, length: 5_000_000)
    HTTPoison.post!(upstream, body)
  end
end
