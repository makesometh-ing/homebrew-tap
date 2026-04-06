# typed: false
# frozen_string_literal: true

class SpotifyMcpGo < Formula
  desc "MCP server that exposes the Spotify Web API as MCP tools"
  homepage "https://github.com/makesometh-ing/spotify-mcp-go"
  version "2026.04.0-rc.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/makesometh-ing/spotify-mcp-go/releases/download/v2026.04.0-rc.1/spotify-mcp-go-darwin-arm64"
      sha256 "bf10a9c76a002656be16a74a982abbc8167b521e1fd21804501bc84965d901b9"

      def install
        bin.install "spotify-mcp-go-darwin-arm64" => "spotify-mcp-go"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/makesometh-ing/spotify-mcp-go/releases/download/v2026.04.0-rc.1/spotify-mcp-go-darwin-amd64"
      sha256 "d03842d260abf3f0cfbc5dfd4539008ce194aba78b7f2f467fd702d78c9223e6"

      def install
        bin.install "spotify-mcp-go-darwin-amd64" => "spotify-mcp-go"
      end
    end
  end

  test do
    assert_match "spotify-mcp-go", shell_output("#{bin}/spotify-mcp-go --help 2>&1", 2)
  end
end
