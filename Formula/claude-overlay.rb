class ClaudeOverlay < Formula
  desc "Manage project-level Claude Code config for custom model providers"
  homepage "https://github.com/mzmmoazam/claude-overlay"
  # version and sha256 are auto-updated by the release workflow
  version "0.2.3"
  url "https://github.com/mzmmoazam/claude-overlay/archive/refs/tags/v#{version}.tar.gz"
  sha256 "e0560f161bec9b90d07a191e255150f3368c7db283fc2912c82606968e21a3ea"
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
