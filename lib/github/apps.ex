defmodule Github.Apps do
  import Github.Client

  @moduledoc """
    [GitHub Apps](https://developer.github.com/v3/apps/).
  """

  @doc """
  User organization

  ## Example

      iex> client = %Github.Client{jwt_token: "jwt_token"}

      iex> client |> Github.Apps.create_access_token!(12345)
      %Github.Client.Response{
        body: %{expires_at: "2018-09-04T04:46:29Z", token: "v1.e4f498f111eb59dbcb1bf7148f4dc8c94e7d3372"},
        status: 201,
        ...
      }
  """
  def create_access_token!(github_client, installation_id) do
    post!(
      "https://api.github.com/app/installations/#{installation_id}/access_tokens",
      [
        {"Authorization", "Bearer #{github_client.jwt_token}"},
        {"Accept", "application/vnd.github.machine-man-preview+json"}
      ]
    )
  end
end
