# frozen_string_literal: true

# Generated for queria-backend private Release cli-v0.3.0
# Do not hand-edit sha256; re-run generate_homebrew_formula.sh when API is up.
# Archive layout: queria-cli-<triple>/queria-cli — brew chdirs into the single
# top-level dir, so install is bin.install "queria-cli" (not a nested path).
#
# Private queria-backend: urls are Releases API asset endpoints.
# brew requires: export HOMEBREW_GITHUB_API_TOKEN=ghp_… (repo read)
# (plain github.com/.../releases/download/ URLs return 404 for private repos).

class QueriaCli < Formula
  desc "QuerIa CLI for laptop index-here + hub TUI (doctor/index/status)"
  homepage "https://github.com/nandocoeg2/queria-backend"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://api.github.com/repos/nandocoeg2/queria-backend/releases/assets/485703228",
          header: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", ENV.fetch("GH_TOKEN", ENV.fetch("GITHUB_TOKEN", "")))}",
          ]
      sha256 "63101cf5b484ef2242edddd1005e1095513467d759e72f3afef58042a05e8c20"
    end
    on_intel do
      url "https://api.github.com/repos/nandocoeg2/queria-backend/releases/assets/485703227",
          header: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", ENV.fetch("GH_TOKEN", ENV.fetch("GITHUB_TOKEN", "")))}",
          ]
      sha256 "eed78888739bff371b8d99458d03ee8633d31162f7c58a32fc38730f42581d56"
    end
  end

  on_linux do
    on_arm do
      url "https://api.github.com/repos/nandocoeg2/queria-backend/releases/assets/485703230",
          header: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", ENV.fetch("GH_TOKEN", ENV.fetch("GITHUB_TOKEN", "")))}",
          ]
      sha256 "e9cdda650d1c3608439a2fbb5552b6d4d368f4041c866ede9285c08841f32983"
    end
    on_intel do
      url "https://api.github.com/repos/nandocoeg2/queria-backend/releases/assets/485703231",
          header: [
            "Accept: application/octet-stream",
            "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", ENV.fetch("GH_TOKEN", ENV.fetch("GITHUB_TOKEN", "")))}",
          ]
      sha256 "40934eab0d3840ff46c511ef724b5d0bc3359cedbe847671e42af1484f2a769b"
    end
  end

  def install
    bin.install "queria-cli"
  end

  test do
    assert_match "index-here", shell_output("#{bin}/queria-cli index-here --help")
  end
end
