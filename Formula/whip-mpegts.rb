class WhipMpegts < Formula
  desc "MPEG-TS WHIP client"
  homepage "https://github.com/Eyevinn/whip-mpegts"
  url "https://github.com/Eyevinn/whip-mpegts/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "dee7027737b4bbfcf466fb49b56a500967d7fb8c94d36c4caaceabd8542864b5"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/Eyevinn/homebrew-tools/releases/download/whip-mpegts-0.1.3"
    sha256 cellar: :any,                 big_sur:      "825ec6f81bd0b0cd82403efec66c5fd10019338691c66d1d76b3059d1c0c30d1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5dd161e9e5cec283a1e63e80a70946f9ad21e8951e64442c51bab453f3cdac58"
  end

  depends_on "cmake" => :build
  depends_on "gst-libav"
  depends_on "gst-plugins-bad"
  depends_on "gst-plugins-base"
  depends_on "gstreamer"
  depends_on "libsoup@2"

  def install
    system "cmake", "-DCMAKE_BUILD_TYPE=Release", "-G", "Unix Makefiles", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    output = shell_output("#{bin}/whip-mpegts", 1).strip
    assert_match "Usage: whip-mpegts", output
  end
end
