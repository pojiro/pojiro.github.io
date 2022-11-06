import Config

config :file_watch,
  dirs: ["."],
  commands: ["make tailwind"],
  patterns: [
    ~r"_includes/.*(html)$",
    ~r"_layouts/.*(html)$",
    ~r"\.\/index.html$"
  ],
  debounce: 100

config :logger,
  level: :none
