import Config

config :es_watch,
  commands: ["make tailwind"],
  patterns: [
    ~r"_includes/.*(html)$",
    ~r"_layouts/.*(html)$",
    ~r"index.html$"
  ],
  debounce: 100
