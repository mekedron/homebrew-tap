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
      sha256 "91f93939616a181118e7e2add78cc43d541be2f6391f79e453ad3f1681f5bb03"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.1/wolt_v2.1.1_darwin_arm64.tar.gz"
      sha256 "76e7f0dcb541204b4ebbc1abdb391a327e47072d44d2b8e2de0766a3dd826ec7"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.1/wolt_v2.1.1_linux_amd64.tar.gz"
      sha256 "82b65978eb3ee9524e21af82b9c155b6368e79a9d81507d099d207f9e9b01451"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.1/wolt_v2.1.1_linux_arm64.tar.gz"
      sha256 "dd6e12b27d64cb507edc2132d5063dc145520f8ecd2e74e1ad56ec12b4758d98"
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
