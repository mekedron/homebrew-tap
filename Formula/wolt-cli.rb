# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.4/wolt_v2.1.4_darwin_amd64.tar.gz"
      sha256 "6c0050794b5dd68b7ca33c38b6cc9ee28d2c6eac2d38c41ad1b24edc690e35eb"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.4/wolt_v2.1.4_darwin_arm64.tar.gz"
      sha256 "95e5fdd08b436c2a8af2dd1dace8e7811ed2da2d6a1d91eab46ab37c3cc8d8b8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.4/wolt_v2.1.4_linux_amd64.tar.gz"
      sha256 "12ad99669ffaa7248a254ef0bcfa5ebc911f16b5417738da10f25909fe0ebe8f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.4/wolt_v2.1.4_linux_arm64.tar.gz"
      sha256 "06e8c766d88b8a5efca1d49860751e8fc11c6b7ed7aceda88869b61bba518ab3"
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
