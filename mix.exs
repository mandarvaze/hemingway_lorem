defmodule HemingwayLorem.MixProject do
  use Mix.Project

  def project do
    [
      app: :hemingway_lorem,
      version: "0.1.1",
      # Should work on older versions as well. Need to test.
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      description: "Lorem Ipsum style random text generator based on the works of Hemingway",
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def package do
    [
      maintainers: ["Mandar Vaze"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/mandarvaze/hemingway_lorem"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.1", only: [:dev]},
      {:ex_doc, "~> 0.20.2", only: [:dev]},
      {:qq, "~> 0.1.2", only: [:dev, :test]}
    ]
  end
end
