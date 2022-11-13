import Config

config :file_watch,
  # dirs to be watched
  dirs: ["."],
  # commands to be executed when detected, multiple commands can be specified
  commands: ["make tailwind"],
  # if true, commands are executed in parallel
  parallel_exec: false,
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
  #     :none  to suppress logs
  level: :debug

# On Windows :file_system needs inotifywait.exe,
# uncomment the following line and configure path to it
# config :file_system, :fs_windows, executable_file: "path/to/inotifywait.exe"
