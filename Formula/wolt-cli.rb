# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.4.1/wolt_v2.4.1_darwin_amd64.tar.gz"
      sha256 "912782eff458a973282ee8652905492dd170a2cccb351ed4849a27c788a85108"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.4.1/wolt_v2.4.1_darwin_arm64.tar.gz"
      sha256 "7719193c3e7c7ec660c289bbf1ca4c3e639340030b75079d135b7ade8898c7d9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.4.1/wolt_v2.4.1_linux_amd64.tar.gz"
      sha256 "40130d2351d4d09bcce327223b847b1c44a12ab2f28a3c0d1039cee26b158a60"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.4.1/wolt_v2.4.1_linux_arm64.tar.gz"
      sha256 "92643a1ea4844f2ab4be241c5c5648e972dd4a9ee593543e60983fa27ba5d3ae"
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
