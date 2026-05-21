# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.0.1/wolt_v2.0.1_darwin_amd64.tar.gz"
      sha256 "6d90c173adf315ca8b4a2098c874b2a2c7d07d2924a6a8ffc6bc474c27ce22c8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.0.1/wolt_v2.0.1_darwin_arm64.tar.gz"
      sha256 "b0d1b6266b2fcd7838596c57224c599538642a0531ffe073af36e6f6cd160a4f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.0.1/wolt_v2.0.1_linux_amd64.tar.gz"
      sha256 "605a5378bb269f5504f850a4339bab6923efd115a14d4f719f9789cbb7f4ad5d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.0.1/wolt_v2.0.1_linux_arm64.tar.gz"
      sha256 "c7aa61f6f92eb4746d734302d2178fe6a11f01c34b35961b7a2e6094e6d24069"
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
