# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.1/wolt_v2.1.1_darwin_amd64.tar.gz"
      sha256 "dc27d83527899581ec48ebc159296b05ea71d87839a62e2fe8a6d20bc164031a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.1/wolt_v2.1.1_darwin_arm64.tar.gz"
      sha256 "de3b8b73a9659ed29e45ebae12bb5f6c2670e40ab8211034adea1808b6013ef5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.1/wolt_v2.1.1_linux_amd64.tar.gz"
      sha256 "bb1b1455de9aaec2b3283af5281cd28428ea854f61ad2be0d1235595bd829a84"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.1/wolt_v2.1.1_linux_arm64.tar.gz"
      sha256 "ca74ea929e2a17f1bbf3e7bef2d1cb0d7a5bcb2721fa5afd081156f357983d48"
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
