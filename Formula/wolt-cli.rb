# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.6/wolt_v2.1.6_darwin_amd64.tar.gz"
      sha256 "19dc44f62c6b1a7493b810c2520519bfb97a452701a64ecae9947206b7502fc4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.6/wolt_v2.1.6_darwin_arm64.tar.gz"
      sha256 "b31cc0287203e5a3078c5f02aa29972b55aef8dfda1260a492aa056686ae75af"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.6/wolt_v2.1.6_linux_amd64.tar.gz"
      sha256 "8e0d26da46f36f476a65c558a37982e15c48a3bcc9108ef8db7071606f101458"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.6/wolt_v2.1.6_linux_arm64.tar.gz"
      sha256 "78a720af33ecab2521ad4b0f2f080b18da2494a8862c4613b24fb9a9d0909169"
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
