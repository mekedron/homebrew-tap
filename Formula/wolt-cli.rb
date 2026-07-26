# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.3.0/wolt_v2.3.0_darwin_amd64.tar.gz"
      sha256 "f6701be12a8ca146ad066da46fe5ef54c155752b5c9b2c0e82f21d41a5f7c0ae"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.3.0/wolt_v2.3.0_darwin_arm64.tar.gz"
      sha256 "a09477625bcf43ba431f49cbba3f86ad5e829fb2c79bba1247641d0fbe4a83b2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.3.0/wolt_v2.3.0_linux_amd64.tar.gz"
      sha256 "ed5b4aa702b87fc11c1805727b6bdb3f2d28cccdc17ce15361a461bbf1ab70fc"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.3.0/wolt_v2.3.0_linux_arm64.tar.gz"
      sha256 "a3cfef50767f6ef996b836c61018233014060c2f70053c1b537a816917065ec9"
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
