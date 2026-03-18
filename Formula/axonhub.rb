class Axonhub < Formula
  desc "All-in-one AI development platform. Use any SDK, access any model"
  homepage "https://github.com/looplj/axonhub"
  version "0.9.18"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/looplj/axonhub/releases/download/v0.9.18/axonhub_0.9.18_darwin_arm64.zip"
      sha256 "ad2b866220c4617ee248bc98c422ac2f1ee4df2c7d2848062cc8cf174ec5ad46"
    else
      url "https://github.com/looplj/axonhub/releases/download/v0.9.18/axonhub_0.9.18_darwin_amd64.zip"
      sha256 "b3cb3fb75c35e7e7845b6332ff67fdd5cd9d4a0aef45d2dd099373183b0c2b67"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/looplj/axonhub/releases/download/v0.9.18/axonhub_0.9.18_linux_arm64.zip"
      sha256 "b6975737572ed1a857c219107ae8c281e5565f9ea57eeb55e5cac27de3ab5084"
    else
      url "https://github.com/looplj/axonhub/releases/download/v0.9.18/axonhub_0.9.18_linux_amd64.zip"
      sha256 "e9071e6311d4a31094e543fd309914d68e1a0d2fcbe208cb4396ae046f042dd6"
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
