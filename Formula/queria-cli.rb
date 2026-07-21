# frozen_string_literal: true

# ============================================================================
# STATUS: NOT READY — PLACEHOLDER only.
# Do NOT advertise `brew install` until this file is rewritten by
# queria-backend/scripts/generate_homebrew_formula.sh against a live cli-v* Release.
#
# All platform branches call `odie` so brew fails immediately with a clear
# message (no silent/zero-sha256 checksum trap).
#
# After Release assets are green (from queria-backend):
#   ./scripts/generate_homebrew_formula.sh cli-v0.1.0
#   # VERSION in formula = semver without cli-v prefix (0.1.0)
#   # default writes this path: ../homebrew-queria/Formula/queria-cli.rb
# then commit+push this tap repo and brew update / reinstall.
# ============================================================================

class QueriaCli < Formula
  desc "QuerIa CLI for laptop index-here (Needs review ingest)"
  homepage "https://github.com/nandocoeg2/queria-backend"
  version "0.0.0-placeholder"
  license "MIT"

  PLACEHOLDER_MSG = <<~EOS
    queria-cli formula is NOT READY (placeholder scaffold).
    sha256 values are not set — do not install.

    Operators:
      1. Publish GitHub Release for tag cli-vX.Y.Z (Release queria-cli green).
      2. From queria-backend (private assets need a token):
           export GH_TOKEN=…   # or GITHUB_TOKEN / HOMEBREW_GITHUB_API_TOKEN
           ./scripts/generate_homebrew_formula.sh cli-vX.Y.Z
         (default out: sibling homebrew-queria/Formula/queria-cli.rb)
      3. Commit+push this tap (homebrew-queria), then:
           brew update && brew reinstall nandocoeg2/queria/queria-cli
         For private Release downloads at install time:
           export HOMEBREW_GITHUB_API_TOKEN=…
  EOS

  on_macos do
    on_arm do
      odie PLACEHOLDER_MSG
    end
    on_intel do
      odie PLACEHOLDER_MSG
    end
  end

  on_linux do
    on_arm do
      odie PLACEHOLDER_MSG
    end
    on_intel do
      odie PLACEHOLDER_MSG
    end
  end

  def install
    # Defensive: if platform DSL ever skips odie, never install from zeros.
    odie PLACEHOLDER_MSG
  end

  test do
    odie PLACEHOLDER_MSG
  end
end
