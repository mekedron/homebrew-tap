# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.4.0/wolt_v2.4.0_darwin_amd64.tar.gz"
      sha256 "9e752aa57362cdce4f05f3924fe8e167b7c08811fd5384efffa6990390c6db22"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.4.0/wolt_v2.4.0_darwin_arm64.tar.gz"
      sha256 "f1358ac40e78ef43a598e920702e5ac61e66d8ae1800808410f8d269787c2867"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.4.0/wolt_v2.4.0_linux_amd64.tar.gz"
      sha256 "fa56de45698be266ab21996e3ca03d9d5e36a6581b5c7a5deecfd3cffcfe30d2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.4.0/wolt_v2.4.0_linux_arm64.tar.gz"
      sha256 "4bbbe9d07e6b357b41fa102107850adcfbc876fccdb07f31c91ff7e81a91bd94"
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
