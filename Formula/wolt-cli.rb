# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.5.2/wolt_v2.5.2_darwin_amd64.tar.gz"
      sha256 "7b56dfd408bde61adbb1ba1bc8b9e92cfac227cb3ef91e7c8ce88661c91a2987"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.5.2/wolt_v2.5.2_darwin_arm64.tar.gz"
      sha256 "75c580f72059c909d762f57318f805418decf44f59ef68c281224b236e0c1c55"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.5.2/wolt_v2.5.2_linux_amd64.tar.gz"
      sha256 "cadc3c6157ab3241daa30224e016fda4866cdc210315fce484227d5d0d19df3b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.5.2/wolt_v2.5.2_linux_arm64.tar.gz"
      sha256 "b886cf65c3d7fe88baf181d027a0ad8ce34aaca32f5d2f08ecb281044bb9238f"
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
