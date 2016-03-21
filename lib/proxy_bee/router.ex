defmodule ProxyBee.Router do
  def run do
     Plug.Adapters.Cowboy.http ProxyBee.Handler, upstream: "http://mockbin.org/bin/b5c75469-9233-4b69-9ef1-e89b486603f5"
  end
end
