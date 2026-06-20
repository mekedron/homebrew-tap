# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.3/wolt_v2.1.3_darwin_amd64.tar.gz"
      sha256 "9ca64c0249620d609f41ecf1ac504f541153022be9bada95b4e59b05da607854"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.3/wolt_v2.1.3_darwin_arm64.tar.gz"
      sha256 "243c91d12dafffdb876868ae59bcd359ea4e4b4315fbb8e6668f4ba418f383d2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.3/wolt_v2.1.3_linux_amd64.tar.gz"
      sha256 "feae0e8f2f784a56d29f4dc1e5634fd64ca5214dbf5f984007842a13b956f88d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.3/wolt_v2.1.3_linux_arm64.tar.gz"
      sha256 "29fa22b581d4c32a89bf7860096e5f372ef292ee96e4f2c2dfb9be3a1510a702"
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
