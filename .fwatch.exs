import Config

config :file_watch,
  # dirs to be watched
  dirs: ["."],
  # commands to be executed when detected, multiple commands can be specified
  commands: ["make tailwind"],
  # path detecting patterns, should be written in regex
  # refs. https://hexdocs.pm/elixir/Regex.html
  patterns: [
    ~r"_includes/.*(html)$",
    ~r"_layouts/.*(html)$",
    ~r"\.\/index.html$"
  ],
  # if your editor touches multiple files in a short period,
  # it can be avoided by increasing the debounce(msec)
  debounce: 100

config :logger,
  # use :debug to show matched path and ran command
  level: :none
