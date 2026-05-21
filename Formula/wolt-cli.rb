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
      sha256 "37ac3cab02f339c540e65028af3c3f27788bd9ebfcf3bbc764164844db85af77"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v1.1.0/wolt_v1.1.0_darwin_arm64.tar.gz"
      sha256 "38bc8bf5279bf6e9a6183835494baccafe26a55ac6354b71988a7ce52e7ec11d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v1.1.0/wolt_v1.1.0_linux_amd64.tar.gz"
      sha256 "223464428a6568aeb78c71750cd81fddd45e1cb57dcab766b97d8f3e61eb995e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v1.1.0/wolt_v1.1.0_linux_arm64.tar.gz"
      sha256 "6a2d413af3a281981d96b8d6b19ea763ab67fa4417ddf3151a3bb86cecd21d8b"
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
