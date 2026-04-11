class ClaudeOverlay < Formula
  desc "Manage project-level Claude Code config for custom model providers"
  homepage "https://github.com/mzmmoazam/claude-overlay"
  # version and sha256 are auto-updated by the release workflow
  version "0.1.0"
  url "https://github.com/mzmmoazam/claude-overlay/archive/refs/tags/v#{version}.tar.gz"
  sha256 "a44a44d5546e14f452df53017ca294acf1d1eded01815991e7545b9e50e87d35"
  license "MIT"

  depends_on "python@3"

  def install
    bin.install "bin/claude-overlay"
    (lib/"claude-overlay").install "lib/engine.py"
    (lib/"claude-overlay/presets").install Dir["lib/presets/*.json"]
    bash_completion.install "completions/claude-overlay.bash" => "claude-overlay"
    zsh_completion.install "completions/claude-overlay.zsh" => "_claude-overlay"
  end

  def caveats
    <<~EOS
      Run 'claude-overlay configure' to set up your provider credentials.
      See https://github.com/mzmmoazam/claude-overlay#quick-start
    EOS
  end

  test do
    assert_match "claude-overlay", shell_output("#{bin}/claude-overlay --version")
  end
end
