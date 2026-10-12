# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.4.2/wolt_v2.4.2_darwin_amd64.tar.gz"
      sha256 "bf51484f79606200c7aeb92094cbb77b2648f253dcbe9063d1fe3004dc700cf0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.4.2/wolt_v2.4.2_darwin_arm64.tar.gz"
      sha256 "e10423ac2e4ac8be8e05bf752a805e34044011f33beff34e05d7e60cea0b69e1"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.4.2/wolt_v2.4.2_linux_amd64.tar.gz"
      sha256 "f6555485bbfb8d159091e9f52689ca768eb71efafe69b0b314e81c197a1c69b3"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.4.2/wolt_v2.4.2_linux_arm64.tar.gz"
      sha256 "ff40138e332c57fa257e4f9195708f61cbb442db3dfbc4982d6eb5b39d7a306f"
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
