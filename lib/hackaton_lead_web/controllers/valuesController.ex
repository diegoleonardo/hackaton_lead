defmodule HackatonLeadWeb.ValuesController do
    use HackatonLeadWeb, :controller
    alias Bolt.Sips, as: Bolt

    def index(conn, _params) do
        values = [%{name: "Joe",
        email: "joe@example.com",
        password: "topsecret",
        stooge: "moe"},
      %{name: "Anne",
        email: "anne@example.com",
        password: "guessme",
        stooge: "larry"},
      %{name: "Franklin",
        email: "franklin@example.com",
        password: "guessme",
        stooge: "curly"},]
        json conn, values
    end

    def busca(conn, %{"busca" => busca}) do
        values = [%{name: "Joe",
        email: "joe@example.com",
        password: "topsecret",
        stooge: "moe"},
      %{name: "Anne",
        email: "anne@example.com",
        password: "guessme",
        stooge: "larry"},
      %{name: "Franklin",
        email: "franklin@example.com",
        password: "guessme",
        stooge: "curly"},]

        json conn, Enum.filter(values, fn(x)-> x.name == busca end)
    end

    def create(conn, create) do

        #   json conn, %{data: create["title"]}

        # changeset = Post.changeset(%Post{}, post_params)
    
        # case Repo.insert(changeset) do
        #   {:ok, post} ->
        #     conn
        #     |> put_flash(:info, "Post created successfully.")
        #     |> redirect(to: post_path(conn, :show, post))
        #   {:error, changeset} ->
        #     render(conn, "new.html", changeset: changeset)
        # end

        title = create["title"]
    
        cypher = """
            CREATE (n:Values {title: \"#{title}\"})
            RETURN n
        """
  
        data = Bolt.query!(Bolt.conn, cypher)
        
        json conn, data

      end
end