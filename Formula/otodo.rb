class Otodo < Formula
  desc "Browse Obsidian vault TODO.md tasks in a terminal UI"
  homepage "https://github.com/zeetec20/obsidian-todo"
  version "0.2.2"

  # Apple Silicon only. Intel hosted runners are retired, so no x64 binary is built.
  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/zeetec20/obsidian-todo/releases/download/v#{version}/otodo-darwin-arm64.tar.gz"
  sha256 "441b20bb7246ddd356525bb5868aabd5f8d88a49dc2127a2c9a02ae4a6672955"

  def install
    bin.install "otodo-darwin-arm64" => "otodo"
  end

  test do
    assert_match "Obsidian TODO", shell_output("#{bin}/otodo --help")
  end
end
