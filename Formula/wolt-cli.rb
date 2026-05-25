# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.0.3/wolt_v2.0.3_darwin_amd64.tar.gz"
      sha256 "e80b3e1d88ce639e624db1d3eb4a15a0b30e736f705be14340b4201eea61c69f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.0.3/wolt_v2.0.3_darwin_arm64.tar.gz"
      sha256 "ff56a873f2ea1bae299ba8638c5d791973e1936872d1adf1b970dc60fa6a2b4e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.0.3/wolt_v2.0.3_linux_amd64.tar.gz"
      sha256 "5e3e46fc3e438c684974094695bee0fee400a271b5f334368c3560a50b105e8e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.0.3/wolt_v2.0.3_linux_arm64.tar.gz"
      sha256 "69e343f0c0b922d9f477a595411dc2edcb42231ce3def7c384ea978ddc09a56a"
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
