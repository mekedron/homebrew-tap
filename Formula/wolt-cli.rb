# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.3.1/wolt_v2.3.1_darwin_amd64.tar.gz"
      sha256 "75c6c483196a249d52ffac00d8ef837b7ab1e6e7bce62e2c650fe8c177f8f21d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.3.1/wolt_v2.3.1_darwin_arm64.tar.gz"
      sha256 "9b741a0dfc8d9379e6bfbd18445b54c6b8bc43fcc9da3373cba397db990ad75a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.3.1/wolt_v2.3.1_linux_amd64.tar.gz"
      sha256 "a7394cc8dea6b55b68e7ac8911b2269cc6d5c77f09085724d14ef34e6edc0047"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.3.1/wolt_v2.3.1_linux_arm64.tar.gz"
      sha256 "4d9eec5f35543d36dc69219979af221b708a7db1641014c37702dcc6ad0f3edf"
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
