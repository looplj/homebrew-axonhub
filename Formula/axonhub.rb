class Axonhub < Formula
  desc "All-in-one AI development platform. Use any SDK, access any model"
  homepage "https://github.com/looplj/axonhub"
  version "0.9.17"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/looplj/axonhub/releases/download/v0.9.17/axonhub_0.9.17_darwin_arm64.zip"
      sha256 "1035425a790ed03f589dc42e85011d6a30a19f4129abdf3ad054083d854499c0"
    else
      url "https://github.com/looplj/axonhub/releases/download/v0.9.17/axonhub_0.9.17_darwin_amd64.zip"
      sha256 "b074573f1a24ec4fea8fe747626c7b44fa8712a5fdecda5afb35c47266812a67"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/looplj/axonhub/releases/download/v0.9.17/axonhub_0.9.17_linux_arm64.zip"
      sha256 "70024febc236c96e220be9a836735e5b641af07bbdf6544b113896d6893e1ace"
    else
      url "https://github.com/looplj/axonhub/releases/download/v0.9.17/axonhub_0.9.17_linux_amd64.zip"
      sha256 "7fabd8ed6dd8daf4dbea985152d10038351e5373539b8e0322435a750c4b2f6f"
    end
  end

  def install
    libexec.install "axonhub"
    (etc/"axonhub").mkpath

    (bin/"axonhub").write <<~SH
      #!/bin/sh
      cd "#{etc}/axonhub" || exit 1
      exec "#{libexec}/axonhub" "$@"
    SH
  end

  service do
    run [opt_bin/"axonhub"]
    keep_alive true
  end

  def caveats
    <<~EOS
      To start axonhub now and restart at login:
        brew services start axonhub
      Or, if you don't want/need a background service you can just run:
        #{opt_bin}/axonhub
    EOS
  end

  test do
    system bin/"axonhub", "version"
  end
end
