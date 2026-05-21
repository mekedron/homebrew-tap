# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.0.0/wolt_v2.0.0_darwin_amd64.tar.gz"
      sha256 "df98015d49920d941fb2c3accf5c625c7ff866890c16a515df95cfb47a9fa339"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.0.0/wolt_v2.0.0_darwin_arm64.tar.gz"
      sha256 "404537a8a3ed6cb9d29a7e69f285f439b70534534ba5e6f62f6719441b884578"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.0.0/wolt_v2.0.0_linux_amd64.tar.gz"
      sha256 "c623c836f6414250a7352712fad0abfbfdac276c8fec8fc091a277dfd56d71f6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.0.0/wolt_v2.0.0_linux_arm64.tar.gz"
      sha256 "ef97eacaf3d7389dcdd0e14c386eefe0a07b61c625a087ec39d55cbd7e5ac418"
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
