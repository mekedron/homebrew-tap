# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.2/wolt_v2.1.2_darwin_amd64.tar.gz"
      sha256 "dd04be02f095327cdfd413e0492b20765a5c9afeaff972c68cca4f480a41f415"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.2/wolt_v2.1.2_darwin_arm64.tar.gz"
      sha256 "dca1084751eadb4d5cab6385209a438db3b121eb0607c4c9c8ccdd893b2cd5f8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.2/wolt_v2.1.2_linux_amd64.tar.gz"
      sha256 "cfa0bab4f7fe63dd2c554d9a910a8182b09673fa90879d73a023e91ecca5b7bc"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.2/wolt_v2.1.2_linux_arm64.tar.gz"
      sha256 "6bb19a7f0a68e93e41a615536dc76bf193bcd3aa93c5f8414318cf1b86d050d0"
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
