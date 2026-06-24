class Otodo < Formula
  desc "Browse Obsidian vault TODO.md tasks in a terminal UI"
  homepage "https://github.com/zeetec20/obsidian-todo"
  version "0.4.6"

  depends_on :macos

  on_arm do
    url "https://github.com/zeetec20/obsidian-todo/releases/download/v#{version}/otodo-darwin-arm64.tar.gz"
    sha256 "1e3cba55df0a2d09458f1f6684f88f76b196c957b34357298f6712ba4f98937e"
  end

  on_intel do
    url "https://github.com/zeetec20/obsidian-todo/releases/download/v#{version}/otodo-darwin-x64.tar.gz"
    sha256 "e1cbe8aac9f11499af40cc15b482b87a351a3df96b60e7b23a8c9758831ab300"
  end

  def install
    bin_name = Hardware::CPU.arm? ? "otodo-darwin-arm64" : "otodo-darwin-x64"
    bin.install bin_name => "otodo"
  end

  test do
    assert_match "Obsidian TODO", shell_output("#{bin}/otodo --help")
  end
end
