# typed: false
# frozen_string_literal: true

class SpotifyMcpGo < Formula
  desc "MCP server that exposes the Spotify Web API as MCP tools"
  homepage "https://github.com/makesometh-ing/spotify-mcp-go"
  version "0.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/makesometh-ing/spotify-mcp-go/releases/download/v#{version}/spotify-mcp-go-darwin-arm64"
      sha256 "PLACEHOLDER"

      def install
        bin.install "spotify-mcp-go-darwin-arm64" => "spotify-mcp-go"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/makesometh-ing/spotify-mcp-go/releases/download/v#{version}/spotify-mcp-go-darwin-amd64"
      sha256 "PLACEHOLDER"

      def install
        bin.install "spotify-mcp-go-darwin-amd64" => "spotify-mcp-go"
      end
    end
  end

  test do
    assert_match "spotify-mcp-go", shell_output("#{bin}/spotify-mcp-go --help 2>&1", 2)
  end
end
