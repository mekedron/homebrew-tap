# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.2.1/wolt_v2.2.1_darwin_amd64.tar.gz"
      sha256 "860c0463e2f2580c6b3ecd8e67fe06ccbd2a41b10daa8ec2faffa5acfab9862d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.2.1/wolt_v2.2.1_darwin_arm64.tar.gz"
      sha256 "15eacc545ea92db8bd483190781f4a57422b48b5db9b2bfed49c319b75e708fc"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.2.1/wolt_v2.2.1_linux_amd64.tar.gz"
      sha256 "23f19e6c0a25e6accc376f0be6a3ba08dea127ce7667a270749b23b8d02f9047"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.2.1/wolt_v2.2.1_linux_arm64.tar.gz"
      sha256 "af037aac126c0682c759e76e77768ce496188877852147c6fd04304b9c69736c"
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
