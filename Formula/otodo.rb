class Otodo < Formula
  desc "Browse Obsidian vault TODO.md tasks in a terminal UI"
  homepage "https://github.com/zeetec20/obsidian-todo"
  version "0.4.7"

  depends_on :macos

  on_arm do
    url "https://github.com/zeetec20/obsidian-todo/releases/download/v#{version}/otodo-darwin-arm64.tar.gz"
    sha256 "bc3da9949457cd796ab567a5a44f5b9d42c493cb93cee736ebeca1be8d4ef56a"
  end

  on_intel do
    url "https://github.com/zeetec20/obsidian-todo/releases/download/v#{version}/otodo-darwin-x64.tar.gz"
    sha256 "a3833297dc4cd24f03dbd84b7d3d610672480fd1e702bba9ca7876ee4b7e3156"
  end

  def install
    bin_name = Hardware::CPU.arm? ? "otodo-darwin-arm64" : "otodo-darwin-x64"
    bin.install bin_name => "otodo"
  end

  test do
    assert_match "Obsidian TODO", shell_output("#{bin}/otodo --help")
  end
end
