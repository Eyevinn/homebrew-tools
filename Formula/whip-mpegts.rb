class WhipMpegts < Formula
  desc "MPEG-TS WHIP client"
  homepage "https://github.com/Eyevinn/whip-mpegts"
  url "https://github.com/Eyevinn/whip-mpegts/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "25d99e66e07f4ce984353ab6afd227e4bb28a9982fd63842ab5af169a4cbf220"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/Eyevinn/homebrew-tools/releases/download/whip-mpegts-0.9.1"
    rebuild 1
    sha256 cellar: :any, arm64_sequoia: "9f65c9f6ee466d6975c3344fdb8e3be7f1efe0934ae51a6249facb29d9bddae7"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "gstreamer"

  def install
    system "cmake", "-DCMAKE_BUILD_TYPE=Release", "-G", "Unix Makefiles", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    output = shell_output("#{bin}/whip-mpegts", 1).strip
    assert_match "Usage: whip-mpegts", output
  end
end
