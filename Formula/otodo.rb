class Otodo < Formula
  desc "Browse Obsidian vault TODO.md tasks in a terminal UI"
  homepage "https://github.com/zeetec20/obsidian-todo"
  version "0.3.0"

  # Apple Silicon only. Intel hosted runners are retired, so no x64 binary is built.
  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/zeetec20/obsidian-todo/releases/download/v#{version}/otodo-darwin-arm64.tar.gz"
  sha256 "aca5468b907e497c47ecf0a5c38007f535d3c41f8b992b3d71187a5c9086264d"

  def install
    bin.install "otodo-darwin-arm64" => "otodo"
  end

  test do
    assert_match "Obsidian TODO", shell_output("#{bin}/otodo --help")
  end
end
