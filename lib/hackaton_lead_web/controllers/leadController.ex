defmodule HackatonLeadWeb.LeadController do
    use HackatonLeadWeb, :controller
    alias Bolt.Sips, as: Bolt

    def create(conn, create) do
        lead = create["lead"]
        # organization = lead.organizacao # create["organização"]
        # address = create["endereco"]

        json conn, lead

    end
end