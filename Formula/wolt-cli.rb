# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.0/wolt_v2.1.0_darwin_amd64.tar.gz"
      sha256 "27bf917ef5e80e820759cc5890fc4c16bbd5c6893b6459ee96c6d5b845257548"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.0/wolt_v2.1.0_darwin_arm64.tar.gz"
      sha256 "c127d4736c349c0bac95a735e7825ffb245d65d24d17e32dce05d04212982706"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.0/wolt_v2.1.0_linux_amd64.tar.gz"
      sha256 "ca114e461c435cc754a6554fe368382c02ef2bbb9c72e7b9c5d2028a7d0e871b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.0/wolt_v2.1.0_linux_arm64.tar.gz"
      sha256 "807135f0c49b1826639dbf7f566511c19de7e936915b35ebe2d83b6e67ea2ce5"
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
