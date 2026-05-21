# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v1.1.0/wolt_v1.1.0_darwin_amd64.tar.gz"
      sha256 "426f4539f119928e35afa534d59dd90d815c46a3bdddb2b1a89c0561a3a3ef0c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v1.1.0/wolt_v1.1.0_darwin_arm64.tar.gz"
      sha256 "84a44343ffa8c70e7f5b41a0dbfe94612065d22a3b2309876eb0b27788053c45"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v1.1.0/wolt_v1.1.0_linux_amd64.tar.gz"
      sha256 "09b51655fe132d052847cbae9740f74932f7d94e59e319ae978ce15baafde89c"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v1.1.0/wolt_v1.1.0_linux_arm64.tar.gz"
      sha256 "0fdadb6a6a03f1cfd7695be6ba1dddd346d97d58307f647bf50e3e230514bc9f"
    end
  end

  def install
    bin.install "wolt"
  end

  test do
    output = shell_output("#{bin}/wolt --help")
    assert_match "wolt", output
  end
end
