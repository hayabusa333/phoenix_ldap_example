defmodule PhoenixLdapExample.Web.PageController do
  use PhoenixLdapExample.Web, :controller
  plug Guardian.Plug.EnsureAuthenticated

  def index(conn, _params) do
    render conn, "index.html"
  end
end
