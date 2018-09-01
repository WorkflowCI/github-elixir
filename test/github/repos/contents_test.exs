defmodule Github.Repos.ContentsTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "creates the status" do
    use_cassette "repos/contents.find!" do
      response = %Github.Client{access_token: "access_token"} |> Github.Repos.Contents.find!(
        repo_path: "WorkflowCI/github",
        path: "README.md",
        ref: "master"
      )

      assert response.status == 200
      assert response.body["path"] == "README.md"
    end
  end
end
