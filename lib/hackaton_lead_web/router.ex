defmodule HackatonLeadWeb.Router do
  use HackatonLeadWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HackatonLeadWeb do
    pipe_through :api

    get "/values", ValuesController, :index
    get "/values/:busca", ValuesController, :busca
    post "/values/create", ValuesController, :create
    post "/leads", LeadController, :create
  end
end
