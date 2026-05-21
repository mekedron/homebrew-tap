# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.0.2/wolt_v2.0.2_darwin_amd64.tar.gz"
      sha256 "4c3361a72cc09c17d66cfd27eed7aa660d4c80d1b7b042534b8174e1b9ab294e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.0.2/wolt_v2.0.2_darwin_arm64.tar.gz"
      sha256 "42a277115b3accfc16c326457ee12dd58eeede3756f7589ecbd35a725cf14665"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.0.2/wolt_v2.0.2_linux_amd64.tar.gz"
      sha256 "e4aa2ed9f41f4f78131b8acf1505f18dcdaad172d6c20c516b21df88fda72147"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.0.2/wolt_v2.0.2_linux_arm64.tar.gz"
      sha256 "0a5bfe525a41a7ecfec9f47199aa04e99d6228115b7c59b6010ed204a0b4de41"
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
