# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.5.1/wolt_v2.5.1_darwin_amd64.tar.gz"
      sha256 "915fda3b49e468b419385783256e797ebc2d334e8d87be9cf4c2e7a8e07ef048"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.5.1/wolt_v2.5.1_darwin_arm64.tar.gz"
      sha256 "e782856f2b906c36a4e5584c860c4bafb6d20dcc77ee502d91b3ec95151d8f48"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.5.1/wolt_v2.5.1_linux_amd64.tar.gz"
      sha256 "e68e124c4668fcc243aed1d8d4d2fa2c5912b43c61e45950b17e2d2d20a7ba7d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.5.1/wolt_v2.5.1_linux_arm64.tar.gz"
      sha256 "c71e6545317b94f792843f90ce79a9f77780f08f7056ce4939c31b86053a309d"
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
