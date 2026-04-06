# typed: false
# frozen_string_literal: true

class SpotifyMcpGo < Formula
  desc "MCP server that exposes the Spotify Web API as MCP tools"
  homepage "https://github.com/makesometh-ing/spotify-mcp-go"
  version "2026.04.0-rc.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/makesometh-ing/spotify-mcp-go/releases/download/v2026.04.0-rc.2/spotify-mcp-go-darwin-arm64"
      sha256 "5ab46115e1e65947f1c12e794cfe54d0b6361d0882bf6eb4195ee95433b63ddb"

      def install
        bin.install "spotify-mcp-go-darwin-arm64" => "spotify-mcp-go"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/makesometh-ing/spotify-mcp-go/releases/download/v2026.04.0-rc.2/spotify-mcp-go-darwin-amd64"
      sha256 "a8d109578d20e1dc613bd82eb543ce7bbcb64555e5814048e4ce6f0a61c02a44"

      def install
        bin.install "spotify-mcp-go-darwin-amd64" => "spotify-mcp-go"
      end
    end
  end

  test do
    assert_match "spotify-mcp-go", shell_output("#{bin}/spotify-mcp-go --help 2>&1")
  end
end
