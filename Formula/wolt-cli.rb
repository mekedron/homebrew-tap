# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.2.0/wolt_v2.2.0_darwin_amd64.tar.gz"
      sha256 "66189f53f40da67d23941158e72d25ca7439de8eb6ea1f1525732fe90f5b3cb5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.2.0/wolt_v2.2.0_darwin_arm64.tar.gz"
      sha256 "2974a91f1a498bf696b54f1fb1788a5c289c639f0506f1dcd9c2d34c6cff1613"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.2.0/wolt_v2.2.0_linux_amd64.tar.gz"
      sha256 "2a6e4aa4051b2140b42a4944d698d79d6a9846501ae5b6b70aea61ef33d3302f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.2.0/wolt_v2.2.0_linux_arm64.tar.gz"
      sha256 "31f4824c650dd5306b19190d0a4f606a21a4be21d73cdd30ce461b6a922f37bc"
    end
  end

  def install
    bin.install "wolt", "wolt-mcp"
  end

  test do
    output = shell_output("#{bin}/wolt --help")
    assert_match "wolt", output
    mcp_output = shell_output("#{bin}/wolt-mcp --version")
    assert_match version.to_s, mcp_output
  end
end
